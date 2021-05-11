import 'dart:async';

import 'package:grpc/service_api.dart';
import 'package:grpc/grpc_connection_interface.dart' show ClientCall;

import '../utils.dart';
import 'ws_connection.dart';

class WsChannel implements ClientChannel {
  String endpoint;
  FutureResult<WsConnection>? _connectionResult;
  final StreamController<String> _callEvents = StreamController<String>();
  Stream<String> get callEvents => _callEvents.stream;

  WsChannel(this.endpoint);

  @override
  Future<void> shutdown() async {
    await _connectionResult?.result?.shutdown();
    _connectionResult = null;
  }

  @override
  Future<void> terminate() async {
    await _connectionResult?.result?.terminate();
    _connectionResult = null;
  }

  @override
  ClientCall<Q, R> createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
    _callEvents.add(method.path);
    final call = ClientCall(method, requests, options);
    getConnection().then((connection) {
      if (call.isCancelled) return;
      connection.dispatchCall(call);
    }, onError: call.onConnectionError);
    return call;
  }

  Future<WsConnection> getConnection() async {
    if (_connectionResult != null) {
      if (_connectionResult!.resolved) {
        var con = _connectionResult!.result;
        if (con == null) {
          // error
          _connectionResult = null;
        } else if (!con.isOpen) {
          // closed
          _connectionResult = null;
        } else {
          return con;
        }
      }
    }

    _connectionResult ??= FutureResult(WsConnection.connect(endpoint));

    return await _connectionResult!.future;
  }

  Future<void> reset([String? endpoint]) async {
    await terminate();
    if (endpoint != null) {
      this.endpoint = endpoint;
    }
  }
}
