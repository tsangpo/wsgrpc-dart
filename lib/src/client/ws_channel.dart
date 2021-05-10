import 'dart:async';

import 'package:grpc/service_api.dart';
import 'package:grpc/grpc_connection_interface.dart' show ClientCall;

import 'utils.dart';
import 'ws_connection.dart';

class WsChannel implements ClientChannel {
  String endpoint;
  FutureResult<WsConnection>? _connectionResult;

  WsChannel(this.endpoint);

  @override
  Future<void> shutdown() async {
    _connectionResult?.result?.shutdown();
    _connectionResult = null;
  }

  @override
  Future<void> terminate() async {
    _connectionResult?.result?.terminate();
    _connectionResult = null;
  }

  @override
  ClientCall<Q, R> createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
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

    if (_connectionResult == null) {
      _connectionResult = FutureResult(WsConnection.connect(endpoint));
    }

    return await _connectionResult!.future;
  }

  reset(String? endpoint) {
    terminate();
    if (endpoint != null) {
      this.endpoint = endpoint;
    }
  }
}
