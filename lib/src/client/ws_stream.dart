import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/shared/streams.dart';
import 'package:grpc/src/shared/message.dart';
import 'package:grpc/src/client/transport/transport.dart';

class WebsocketTransportStream extends GrpcTransportStream {
  final Function _onTerminate;

  final StreamController<GrpcMessage> _incomingMessages = StreamController();
  StreamSink<GrpcMessage> get incomingMessagesSink => _incomingMessages.sink;
  Stream<GrpcMessage> get incomingMessages => _incomingMessages.stream;

  final StreamController<List<int>> _outgoingMessages = StreamController();
  Stream<List<int>> get outgoingMessagesStream => _outgoingMessages.stream;
  StreamSink<List<int>> get outgoingMessages => _outgoingMessages.sink;

  WebsocketTransportStream(this._onTerminate) {}

  @override
  Future<void> terminate() async {
    _onTerminate();
  }
}
