import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:http2/transport.dart';

import '../generated/wsgrpc.pb.dart';
import './stream.dart';

class WSTransportConnection {
  WebSocket _ws;
  int _nextStreamID;
  final Map<int, WSCallStream> _openStreams = {};

  static Future<WSTransportConnection> connect(String endpoint) async {
    var ws = await WebSocket.connect(endpoint);
    return new WSTransportConnection(ws);
  }

  WSTransportConnection(this._ws, [this._nextStreamID = 1]) {
    _ws.listen(_onData, onDone: _onClose);
  }

  void _onData(dynamic data) {
    print("ondata: ${data}");
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
    _openStreams.values.toList().forEach((stream) {
      stream.terminate();
    });
    _openStreams.clear();
  }

  _feedHeaderMessage(WSCallStream stream, DataFrame frame) {
    var headers = new List<Header>();
    headers.add(Header.ascii(':status', frame.headers.status));
    headers.add(Header.ascii('grpc-status', frame.headers.rpcStatus));
    headers.add(Header.ascii('grpc-message', frame.headers.rpcMessage));
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
    this.sendHeaders(streamID, path);
    this._nextStreamID += 2;
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

  sendHeaders(int streamID, String path, [String status]) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.HEADERS
      ..headers = (new DataFrame_Headers()..path = path)
      ..endStream = false);
  }

  sendMessage(int streamID, Uint8List message) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.MESSAGE
      ..message = message
      ..endStream = false);
  }

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

  sendStreamEnd(int streamID) {
    this.send(new DataFrame()
      ..streamId = streamID
      ..type = DataFrame_Types.MESSAGE
      ..endStream = true);
  }

  bool get isOpen => _ws.readyState == WebSocket.OPEN;

  Future finish() {
    //TODO: handle openingStream
    return _ws.close();
  }

  Future terminate() {
    //TODO: handle openingStream
    return _ws.close();
  }
}
