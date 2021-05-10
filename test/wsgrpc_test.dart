import 'package:test/test.dart';
import 'package:wsgrpc/wsgrpc.dart';

void main() {
  test('create channel', () async {
    var channel = WsChannel('wss://api.kigis.net/wsgrpc');
    await channel.shutdown();
  });
}
