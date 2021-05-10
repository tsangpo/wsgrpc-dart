import 'package:test/test.dart';

import 'package:wsgrpc/src/client/utils.dart';

void main() {
  test('utils', () async {
    var f = Future.value(1);
    var fr = new FutureResult(f);
    print("fr before: ${fr.resolved} ${fr.result}");
    await fr.future;
    print("fr after: ${fr.resolved} ${fr.result}");

    var fr2 = new FutureResult(f);
    print("fr2: ${fr2.resolved} ${fr2.result}");
  });
}
