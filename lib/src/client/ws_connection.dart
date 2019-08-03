import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/connection.dart' as connection;
import 'package:grpc/src/client/transport/transport.dart';

import 'ws_transport.dart';

class WebsocketClientConnection implements connection.ClientConnection {
  final ChannelOptions options;

  String get authority => options.credentials.authority ?? Uri.parse(url).host;

  connection.ConnectionState _state = ConnectionState.idle;

  final _pendingCalls = <ClientCall>[];

  WebsocketTransport _transportConnection;

  /// Used for idle and reconnect timeout, depending on [_state].
  Timer _timer;
  Duration _currentReconnectDelay;

  final String url;

  WebsocketClientConnection(this.url, this.options);

  ChannelCredentials get credentials => options.credentials;

  ConnectionState get state => _state;

  Future<WebsocketTransport> connectTransport() async {
    return await WebsocketTransport.connect(url);
  }

  void _connect() {
    if (_state != ConnectionState.idle &&
        _state != ConnectionState.transientFailure) {
      return;
    }
    _setState(ConnectionState.connecting);
    connectTransport().then((transport) {
      _currentReconnectDelay = null;
      _transportConnection = transport;
      transport.onDone = _handleSocketClosed;
      transport.onActiveStateChanged = _handleActiveStateChanged;
      _setState(ConnectionState.ready);
      _pendingCalls.forEach(_startCall);
      _pendingCalls.clear();
    }).catchError(_handleConnectionFailure);
  }

  void dispatchCall(ClientCall call) {
    switch (_state) {
      case ConnectionState.ready:
        _startCall(call);
        break;
      case ConnectionState.shutdown:
        _shutdownCall(call);
        break;
      default:
        _pendingCalls.add(call);
        if (_state == ConnectionState.idle) {
          _connect();
        }
    }
  }

  GrpcTransportStream makeRequest(String path, Duration timeout,
      Map<String, String> metadata, ErrorHandler onRequestFailure) {
    return _transportConnection.makeRequest(path, onRequestFailure);
  }

  void _startCall(ClientCall call) {
    if (call.isCancelled) return;
    call.onConnectionReady(this);
  }

  void _failCall(ClientCall call, dynamic error) {
    if (call.isCancelled) return;
    call.onConnectionError(error);
  }

  void _shutdownCall(ClientCall call) {
    _failCall(call, 'Connection shutting down.');
  }

  Future<void> shutdown() async {
    if (_state == ConnectionState.shutdown) return null;
    _setShutdownState();
    await _transportConnection?.finish();
  }

  Future<void> terminate() async {
    _setShutdownState();
    await _transportConnection?.terminate();
  }

  void _setShutdownState() {
    _setState(ConnectionState.shutdown);
    _cancelTimer();
    _pendingCalls.forEach(_shutdownCall);
    _pendingCalls.clear();
  }

  void _setState(ConnectionState state) {
    _state = state;
  }

  void _handleIdleTimeout() {
    if (_timer == null || _state != ConnectionState.ready) return;
    _cancelTimer();
    _transportConnection
        ?.finish()
        ?.catchError((_) => {}); // TODO(jakobr): Log error.
    _transportConnection = null;
    _setState(ConnectionState.idle);
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _handleActiveStateChanged(bool isActive) {
    if (isActive) {
      _cancelTimer();
    } else {
      if (options.idleTimeout != null) {
        _timer ??= Timer(options.idleTimeout, _handleIdleTimeout);
      }
    }
  }

  bool _hasPendingCalls() {
    // Get rid of pending calls that have timed out.
    _pendingCalls.removeWhere((call) => call.isCancelled);
    return _pendingCalls.isNotEmpty;
  }

  void _handleConnectionFailure(error) {
    _transportConnection = null;
    if (_state == ConnectionState.shutdown || _state == ConnectionState.idle) {
      return;
    }
    // TODO(jakobr): Log error.
    _cancelTimer();
    _pendingCalls.forEach((call) => _failCall(call, error));
    _pendingCalls.clear();
    _setState(ConnectionState.idle);
  }

  void _handleReconnect() {
    if (_timer == null || _state != ConnectionState.transientFailure) return;
    _cancelTimer();
    _connect();
  }

  void _handleSocketClosed() {
    _cancelTimer();
    _transportConnection = null;

    if (_state == ConnectionState.idle && _state == ConnectionState.shutdown) {
      // All good.
      return;
    }

    // We were not planning to close the socket.
    if (!_hasPendingCalls()) {
      // No pending calls. Just hop to idle, and wait for a new RPC.
      _setState(ConnectionState.idle);
      return;
    }

    // We have pending RPCs. Reconnect after backoff delay.
    _setState(ConnectionState.transientFailure);
    _currentReconnectDelay = options.backoffStrategy(_currentReconnectDelay);
    _timer = Timer(_currentReconnectDelay, _handleReconnect);
  }
}

class _ShutdownException implements Exception {}
