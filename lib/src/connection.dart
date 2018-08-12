// Copyright (c) 2017, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';

import 'package:http2/transport.dart';
import 'package:grpc/grpc.dart';

import './transport.dart';

enum ConnectionState {
  /// Not currently connected, and no pending RPCs.
  open,

  /// Shutting down, no further RPCs allowed.
  shutdown
}

/// A connection to a single RPC endpoint.
///
/// RPCs made on a connection are always sent to the same endpoint.
class WSClientConnection extends ClientConnection {
  final String endpoint;
  ConnectionState _state;

  Future<WSTransportConnection> _transportFuture;
  WSTransportConnection transport;

  WSClientConnection(this.endpoint)
      : _state = ConnectionState.open,
        super(
            '',
            0,
            const ChannelOptions(
                credentials: const ChannelCredentials.insecure()));

  Future ensureConnect() async {
    if (_transportFuture != null) {
      await _transportFuture;
      if (transport.isOpen) {
        return;
      }
    }
    _transportFuture = _connectTransport();
    await _transportFuture;
  }

  Future<WSTransportConnection> _connectTransport() async {
    var transport = await WSTransportConnection.connect(endpoint);
    if (_state == ConnectionState.shutdown) {
      transport.terminate();
      throw 'Shutting down';
    }
    this.transport = transport;
    return transport;
  }

  //called by channel, should not throw error, because not await catched
  void dispatchCall(ClientCall call) {
    switch (_state) {
      case ConnectionState.open:
        _startCall(call);
        break;
      case ConnectionState.shutdown:
        _failCall(call, 'Connection shutting down.');
        break;
    }
  }

  // called by call
  ClientTransportStream makeRequest(
      String path, Duration timeout, Map<String, String> metadata) {
    return transport.makeRequest(path);
  }

  void _startCall(ClientCall call) async {
    try {
      await ensureConnect();
      if (call.isCancelled) return;
      call.onConnectionReady(this);
    } catch (error) {
      if (call.isCancelled) return;
      call.onConnectionError(error);
    }
  }

  void _failCall(ClientCall call, dynamic error) {
    if (call.isCancelled) return;
    call.onConnectionError(error);
  }

  /// Shuts down this connection.
  ///
  /// No further calls may be made on this connection, but existing calls
  /// are allowed to finish.
  Future<Null> shutdown() async {
    if (_state == ConnectionState.shutdown) return null;
    this._state = ConnectionState.shutdown;
    await transport?.finish();
  }

  /// Terminates this connection.
  ///
  /// All open calls are terminated immediately, and no further calls may be
  /// made on this connection.
  Future<Null> terminate() async {
    this._state = ConnectionState.shutdown;
    await transport?.terminate();
  }
}
