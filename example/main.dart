import 'dart:math';

import 'package:wsgrpc/wsgrpc.dart';

import 'protos/generated/route_guide.pbgrpc.dart';

void main() async {
  var channel = WsChannel('ws://localhost:2345/wsgrpc');
  var stub = RouteGuideClient(channel);

// 111111111111
  var res1 = await stub.getFeature(Point(latitude: 1, longitude: 2));
  print('getFeature: $res1');

// 222222222222
  var res2 = stub.listFeatures(Rectangle(
      lo: Point(latitude: 1, longitude: 2),
      hi: Point(latitude: 3, longitude: 4)));
  try {
    await for (var feature in res2) {
      print('listFeatures: $feature');
    }
  } catch (e) {
    print('ERROR: $e');
  }

  // 33333333333
  final random = Random();
  Stream<Point> generateRoute(int count) async* {
    for (var i = 0; i < count; i++) {
      final point =
          Point(latitude: random.nextInt(10), longitude: random.nextInt(10));
      yield point;
    }
  }

  final pointCount = random.nextInt(100) + 2;
  final summary = await stub.recordRoute(generateRoute(pointCount));
  print('Route summary: $summary');
}
