import 'package:test/test.dart';

import 'package:wsgrpc/wsgrpc.dart';

void main() {
  test('create channel', () async {
    var channel = new WSClientChannel('wss://api.kigis.net/wsgrpc');
    expect(channel.endpoint, 'wss://api.kigis.net/wsgrpc');
    await channel.shutdown();
  });
}
