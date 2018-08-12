import 'dart:async';

import 'package:http2/transport.dart';

class WSCallStream extends TransportStream implements ClientTransportStream {
  final int id;
  final StreamController<StreamMessage> incomingC;
  final StreamController<StreamMessage> outgoingC;
  final Stream<TransportStreamPush> peerPushes = null;
  Stream<StreamMessage> get incomingMessages => incomingC.stream;
  StreamSink<StreamMessage> get outgoingMessages => outgoingC.sink;

  WSCallStream(this.id)
      : incomingC = new StreamController(),
        outgoingC = new StreamController();

  @override
  void terminate() {
    this.outgoingC.close();
  }

  @override
  set onTerminated(void Function(int v) value) {
    // TODO: implement onTerminated
  }
}
