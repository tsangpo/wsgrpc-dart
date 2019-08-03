import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/channel.dart';
import 'package:grpc/src/client/connection.dart';

import 'ws_connection.dart';

/// A channel to a virtual gRPC endpoint.
///
/// For each RPC, the channel picks a [Http2ClientConnection] to dispatch the call.
/// RPCs on the same channel may be sent to different connections, depending on
/// load balancing settings.
class ClientChannel extends ClientChannelBase {
  String url;
  StreamController<String> _callEvents = new StreamController();
  StreamController<dynamic> _callErrors = new StreamController();
  Stream<String> get callEvents => _callEvents.stream;
  Stream<dynamic> get callErrors => _callErrors.stream;

  final ChannelOptions options;
  ClientConnection _connection;

  ClientChannel(this.url, {this.options = const ChannelOptions()}) : super();

  bool _isShutdown = false;

  @override
  Future<void> shutdown() async {
    if (_isShutdown) return;
    _isShutdown = true;
    if (_connection != null) await _connection.shutdown();
  }

  @override
  Future<void> terminate() async {
    _isShutdown = true;
    if (_connection != null) await _connection.terminate();
  }

  /// Returns a connection to this [Channel]'s RPC endpoint.
  ///
  /// The connection may be shared between multiple RPCs.
  Future<ClientConnection> getConnection() async {
    if (_isShutdown) throw GrpcError.unavailable('Channel shutting down.');
    return _connection ??= createConnection();
  }

  @override
  ClientCall<Q, R> createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
    final call = ClientCall(method, requests, options);

    getConnection().then((connection) {
      if (call.isCancelled) return;
      connection.dispatchCall(call);
      _callEvents.add(method.path);
    }, onError: (err) {
      call.onConnectionError(err);
      _callErrors.add(err);
    });

    return call;
  }

  ClientConnection createConnection() {
    return WebsocketClientConnection(url, options);
  }

  // http2没有的扩展函数

  reset([String url]) {
    if (url != null) {
      this.url = url;
    }
    _connection?.terminate();
    _connection = null;
  }
}
