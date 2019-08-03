import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/transport/transport.dart';

import '../../generated/wsgrpc.pb.dart';
import 'ws_stream.dart';

typedef void ActiveStateChangedCallback(bool isActive);

class WebsocketTransport {
  WebSocket _ws;
  int _nextStreamID;
  final Map<int, WebsocketTransportStream> _openStreams = {};
  DateTime lastSeenTime;
  Function onDone;
  ActiveStateChangedCallback onActiveStateChanged;

  static Future<WebsocketTransport> connect(String endpoint) async {
    var ws = await WebSocket.connect(endpoint);
    return new WebsocketTransport(ws);
  }

  WebsocketTransport(this._ws, [this._nextStreamID = 1]) {
    lastSeenTime = DateTime.now();
    _ws.pingInterval = Duration(seconds: 10);
    _ws.listen(_onData, onDone: _onClose, onError: _onError);
  }

  void _onData(dynamic data) {
    lastSeenTime = DateTime.now();
    if (data == "ping") {
      _ws.add("pong");
      return;
    } else if (data == "pong") {
      return;
    }

    var frame = DataFrame.fromBuffer(data);
    var streamID = frame.streamId;
    if (!_openStreams.containsKey(streamID)) {
      //TODO: log unkown stream
      return;
    }

    var stream = _openStreams[streamID];
    switch (frame.type) {
      case DataFrame_Types.MESSAGE:
        _feedDataMessage(stream, frame);
        break;
      case DataFrame_Types.HEADERS:
        _feedHeaderMessage(stream, frame);
        break;
      case DataFrame_Types.TRAILERS:
        _feedHeaderMessage(stream, frame);
        break;
    }
    if (frame.endStream) {
      stream.incomingMessagesSink.close();
      _openStreams.remove(streamID);
    }
    if (onActiveStateChanged != null) {
      onActiveStateChanged(_openStreams.length > 0);
    }
  }

  void _onClose() {
    print('1ws._onClose');
    print('2ws._onClose');
    print('3ws._onClose');
    print('4ws._onClose');
    _openStreams.values.toList().forEach((stream) {
      stream.incomingMessagesSink.close();
    });
    _openStreams.clear();
    if (onDone != null) {
      onDone();
    }
  }

  void _onError(dynamic error) {
    print('1ws._onError $error');
    print('2ws._onError $error');
    print('3ws._onError $error');
    print('4ws._onError $error');
  }

  _feedHeaderMessage(WebsocketTransportStream stream, DataFrame frame) {
    var metadata = new Map<String, String>();
    metadata[':status'] = frame.headers.status;
    metadata['grpc-status'] = frame.headers.rpcStatus;
    metadata['grpc-message'] = frame.headers.rpcMessage;
    if (frame.headers.rpcStatus != "0" &&
        frame.headers.rpcMessage != null &&
        frame.headers.rpcMessage != "") {
      print("grpc error: ${frame.headers.rpcMessage}");
    }
    stream.incomingMessagesSink.add(new GrpcMetadata(metadata));
  }

  _feedDataMessage(WebsocketTransportStream stream, DataFrame frame) {
    var data = frame.message;
    if (data != null) {
      stream.incomingMessagesSink.add(new GrpcData(data));
    }
  }

  WebsocketTransportStream makeRequest(
      String path, ErrorHandler onRequestFailure) {
    var streamID = this._nextStreamID;
    this._nextStreamID += 2;
    this.sendHeaders(streamID, path);
    var stream = new WebsocketTransportStream(() {
      terminateStream(streamID);
    });
    this._openStreams[streamID] = stream;

    stream.outgoingMessagesStream.handleError(onRequestFailure).listen((data) {
      // send data
      sendMessage(streamID, data);
    }, onDone: () {
      // end stream
      sendStreamEnd(streamID);
    }, cancelOnError: true);

    return stream;
  }

  send(DataFrame frame) {
    if (!this.isOpen) {
      throw ("connection is closed");
    }
    //console.debug("[Protocol] -> ", frame);
    var data = frame.writeToBuffer();
    //console.log("[Protocol] send.data:", data);
    _ws.add(data);
  }

  sendMessage(int streamID, Uint8List message) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.MESSAGE
      ..message = message
      ..endStream = false);
  }

  sendStreamEnd(int streamID) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.MESSAGE
      ..endStream = true);
  }

  terminateStream(int streamID) {
    if (_openStreams.containsKey(streamID)) {
      var stream = _openStreams[streamID];
      stream.incomingMessagesSink.close();
      _openStreams.remove(streamID);
    }
  }

  // for server
  sendHeaders(int streamID, String path, [String status]) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.HEADERS
      ..headers = (new DataFrame_Headers()..path = path)
      ..endStream = false);
  }

  // for server
  sendTrailers(
      int streamID, String status, String rpcStatus, String rpcMessage) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.HEADERS
      ..headers = (new DataFrame_Headers()
        ..status = status
        ..rpcStatus = rpcStatus
        ..rpcMessage = rpcMessage)
      ..endStream = true);
  }

  // can used by connection to ensure transport is ready
  bool get isOpen {
    // close stale connection
    // print("ws.isOpen: ${_ws.readyState}, ${lastSeenTime}");
    if (DateTime.now().difference(lastSeenTime) > Duration(seconds: 20)) {
      _ws.close();
      return false;
    }
    return _ws.readyState == WebSocket.open;
  }

  Future finish() {
    print("wsgrpc.transport.finish");
    return _ws.close();
  }

  Future terminate() {
    print("wsgrpc.transport.terminate");
    return _ws.close();
  }
}
