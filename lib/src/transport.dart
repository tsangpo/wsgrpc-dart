import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http2/transport.dart';

import '../generated/wsgrpc.pb.dart';
import './stream.dart';

class WSTransportConnection {
  WebSocket _ws;
  int _nextStreamID;
  final Map<int, WSCallStream> _openStreams = {};
  DateTime lastSeenTime;

  static Future<WSTransportConnection> connect(String endpoint) async {
    var ws = await WebSocket.connect(endpoint);
    return new WSTransportConnection(ws);
  }

  WSTransportConnection(this._ws, [this._nextStreamID = 1]) {
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
      stream.incomingC.close();
      _openStreams.remove(streamID);
    }
  }

  void _onClose() {
    print('1ws._onClose');
    print('2ws._onClose');
    print('3ws._onClose');
    print('4ws._onClose');
    _openStreams.values.toList().forEach((stream) {
      stream.terminate();
    });
    _openStreams.clear();
  }

  void _onError(dynamic error) {
    print('1ws._onError $error');
    print('2ws._onError $error');
    print('3ws._onError $error');
    print('4ws._onError $error');
    _onClose();
  }

  _feedHeaderMessage(WSCallStream stream, DataFrame frame) {
    var headers = new List<Header>();
    headers.add(Header.ascii(':status', frame.headers.status));
    //headers.add(Header.ascii('content-type', 'application/grpc'));
    headers.add(Header.ascii('grpc-status', frame.headers.rpcStatus));
    headers.add(Header(ascii.encode('grpc-message'),
        ascii.encode(Uri.encodeComponent(frame.headers.rpcMessage))));
    //headers.add(Header(
    //    ascii.encode('grpc-message'), utf8.encode(frame.headers.rpcMessage)));
    if (frame.headers.rpcStatus != "0" &&
        frame.headers.rpcMessage != null &&
        frame.headers.rpcMessage != "") {
      print("grpc error: ${frame.headers.rpcMessage}");
    }
    var msg = new HeadersStreamMessage(headers, endStream: frame.endStream);
    stream.incomingC.add(msg);
  }

  _feedDataMessage(WSCallStream stream, DataFrame frame) {
    var data = frame.message;
    if (data != null) {
      var bin = new Uint8List(5 + data.length);
      var headview = new ByteData.view(bin.buffer);
      headview.setInt32(1, data.length);
      bin.setAll(5, data);
      var msg = new DataStreamMessage(bin, endStream: frame.endStream);
      stream.incomingC.add(msg);
    }
  }

  ClientTransportStream makeRequest(String path) {
    var streamID = this._nextStreamID;
    this._nextStreamID += 2;
    this.sendHeaders(streamID, path);
    var stream = new WSCallStream(streamID);
    this._openStreams[streamID] = stream;

    stream.outgoingC.stream.listen((msg) {
      // DataStreamMessage
      if (msg is DataStreamMessage) {
        sendMessage(streamID, msg.bytes.sublist(5));
      }
      // client stream not send headers and trailers
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

  bool get isOpen {
    // close stale connection
    // print("ws.isOpen: ${_ws.readyState}, ${lastSeenTime}");
    if (DateTime.now().difference(lastSeenTime) > Duration(seconds: 10)) {
      _ws.close();
      return false;
    }
    return _ws.readyState == WebSocket.open;
  }

  Future finish() {
    //TODO: handle openingStream
    print("wsgrpc.transport.finish");
    return _ws.close();
  }

  Future terminate() {
    //TODO: handle openingStream
    print("wsgrpc.transport.terminate");
    return _ws.close();
  }
}
