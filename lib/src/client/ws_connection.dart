import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc_connection_interface.dart';
import 'package:wsgrpc/generated/data.pb.dart';

import 'ws_stream.dart';

class WsConnection implements ClientConnection {
  WebSocket ws;
  @override
  final String authority;
  @override
  final String scheme;
  Map<int, WsStream> streams = Map();
  int _callID = 1;

  WsConnection(this.ws, this.authority, this.scheme) {
    ws.pingInterval = Duration(seconds: 10);
    ws.listen(_onData,
        onDone: _onClose, onError: _onError, cancelOnError: true);
  }

  void _onData(dynamic data) {
    print('ondata: $data');
    var frame = DataFrame.fromBuffer(data);
    print('ondata frame: $frame');
    streams[frame.callID]?.onDataFrame(frame);
  }

  void _onClose() {
    streams.values.toList().forEach((stream) {
      stream.onClose();
    });
    streams.clear();
  }

  void _onError(dynamic error) {
    //
  }

  int _nextCallID() {
    var callID = _callID;
    _callID += 2;
    return callID;
  }

  void _sendDataFrame(DataFrame frame) {
    if (ws.readyState != WebSocket.open) {
      throw ('connection is closed');
    }
    //console.debug("[Protocol] -> ", frame);
    var data = frame.writeToBuffer();
    //console.log("[Protocol] send.data:", data);
    ws.add(data);
  }

  static Future<WsConnection> connect(String endpoint,
      [Map<String, dynamic>? headers]) async {
    var ws = await WebSocket.connect(endpoint, headers: headers);
    var uri = Uri.parse(endpoint);
    return WsConnection(ws, uri.host, uri.scheme);
  }

  bool get isOpen => ws.readyState == WebSocket.open;

  //////////////////
  /// ClientConnection
  //////////////////

  @override
  void dispatchCall(ClientCall call) {
    call.onConnectionReady(this);
  }

  @override
  GrpcTransportStream makeRequest(String path, Duration? timeout,
      Map<String, String> metadata, ErrorHandler onRequestFailure,
      {required CallOptions callOptions}) {
    var callID = _nextCallID();

    var sm = path.substring(1).split('/');
    var service = sm[0];
    var method = sm[1];
    var firstFrame = true;

    var stream = WsStream(
        onOutgoingMessageData: (data) {
          if (firstFrame) {
            _sendDataFrame(DataFrame(
                callID: callID,
                header: DataFrame_Header(service: service, method: method),
                body: data));
            firstFrame = false;
          }
          _sendDataFrame(DataFrame(callID: callID, body: data));
        },
        onOutgoingMessageError: (dynamic error) {
          _sendDataFrame(DataFrame(
              callID: callID,
              trailer: DataFrame_Trailer(
                  status: DataFrame_Trailer_Status.ERROR,
                  message: error.toString())));
        },
        onOutgoingMessageDone: () {
          _sendDataFrame(DataFrame(
              callID: callID,
              trailer: DataFrame_Trailer(status: DataFrame_Trailer_Status.OK)));
        },
        onRequestFailure: onRequestFailure,
        onIncomingMessageDone: () {
          streams.remove(callID);
        },
        onTerminate: () {
          streams.remove(callID);
        });
    streams[callID] = stream;

    return stream;
  }

  /// Shuts down this connection.
  ///
  /// No further calls may be made on this connection, but existing calls
  /// are allowed to finish.
  @override
  Future<void> shutdown() async {}

  /// Terminates this connection.
  ///
  /// All open calls are terminated immediately, and no further calls may be
  /// made on this connection.
  @override
  Future<void> terminate() async {
    await ws.close();
  }
}
