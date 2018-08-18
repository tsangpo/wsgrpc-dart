import 'dart:async';

import 'package:grpc/grpc.dart';

import './connection.dart';

/// A channel to a virtual RPC endpoint.
///
/// For each RPC, the channel picks a [ClientConnection] to dispatch the call.
/// RPCs on the same channel may be sent to different connections, depending on
/// load balancing settings.
class WSClientChannel implements ClientChannel {
  String endpoint;

  // TODO(jakobr): Multiple connections, load balancing.
  ClientConnection _connection;

  bool _isShutdown = false;

  WSClientChannel(this.endpoint);

  reset(String endpoint) {
    this.endpoint = endpoint;
    _connection?.terminate();
    _connection = null;
  }

  /// Shuts down this channel.
  ///
  /// No further RPCs can be made on this channel. RPCs already in progress will
  /// be allowed to complete.
  Future<Null> shutdown() {
    if (_isShutdown) return new Future.value();
    _isShutdown = true;
    return _connection?.shutdown();
  }

  /// Terminates this channel.
  ///
  /// RPCs already in progress will be terminated. No further RPCs can be made
  /// on this channel.
  Future<Null> terminate() {
    _isShutdown = true;
    return _connection?.terminate();
  }

  /// Returns a connection to this [Channel]'s RPC endpoint.
  ///
  /// The connection may be shared between multiple RPCs.
  Future<WSClientConnection> getConnection() async {
    if (_isShutdown) throw new GrpcError.unavailable('Channel shutting down.');
    return _connection ??= new WSClientConnection(endpoint);
  }

  /// Initiates a new RPC on this connection.
  ClientCall<Q, R> createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
    final call = new ClientCall(method, requests, options);
    getConnection().then((connection) {
      if (call.isCancelled) return;
      connection.dispatchCall(call);
    }, onError: call.onConnectionError);
    return call;
  }

  // TODO: implement host
  @override
  String get host => null;

  @override
  ChannelOptions get options =>
      const ChannelOptions(credentials: const ChannelCredentials.insecure());

  // TODO: implement port
  @override
  int get port => null;
}
