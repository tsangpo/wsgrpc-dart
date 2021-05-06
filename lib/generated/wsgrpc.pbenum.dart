///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DataFrame_Types extends $pb.ProtobufEnum {
  static const DataFrame_Types NOOP = DataFrame_Types._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOOP');
  static const DataFrame_Types HEADERS = DataFrame_Types._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HEADERS');
  static const DataFrame_Types TRAILERS = DataFrame_Types._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TRAILERS');
  static const DataFrame_Types MESSAGE = DataFrame_Types._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE');

  static const $core.List<DataFrame_Types> values = <DataFrame_Types> [
    NOOP,
    HEADERS,
    TRAILERS,
    MESSAGE,
  ];

  static final $core.Map<$core.int, DataFrame_Types> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DataFrame_Types? valueOf($core.int value) => _byValue[value];

  const DataFrame_Types._($core.int v, $core.String n) : super(v, n);
}

