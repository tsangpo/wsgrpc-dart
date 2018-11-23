///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class DataFrame_Types extends $pb.ProtobufEnum {
  static const DataFrame_Types NOOP = const DataFrame_Types._(0, 'NOOP');
  static const DataFrame_Types HEADERS = const DataFrame_Types._(1, 'HEADERS');
  static const DataFrame_Types TRAILERS = const DataFrame_Types._(2, 'TRAILERS');
  static const DataFrame_Types MESSAGE = const DataFrame_Types._(3, 'MESSAGE');

  static const List<DataFrame_Types> values = const <DataFrame_Types> [
    NOOP,
    HEADERS,
    TRAILERS,
    MESSAGE,
  ];

  static final Map<int, dynamic> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DataFrame_Types valueOf(int value) => _byValue[value] as DataFrame_Types;
  static void $checkItem(DataFrame_Types v) {
    if (v is! DataFrame_Types) $pb.checkItemFailed(v, 'DataFrame_Types');
  }

  const DataFrame_Types._(int v, String n) : super(v, n);
}

