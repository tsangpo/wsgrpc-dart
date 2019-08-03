///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wsgrpc.pbenum.dart';

export 'wsgrpc.pbenum.dart';

class DataFrame_Headers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DataFrame.Headers', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Headers._() : super();
  factory DataFrame_Headers() => create();
  factory DataFrame_Headers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame_Headers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DataFrame_Headers clone() => DataFrame_Headers()..mergeFromMessage(this);
  DataFrame_Headers copyWith(void Function(DataFrame_Headers) updates) => super.copyWith((message) => updates(message as DataFrame_Headers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame_Headers create() => DataFrame_Headers._();
  DataFrame_Headers createEmptyInstance() => create();
  static $pb.PbList<DataFrame_Headers> createRepeated() => $pb.PbList<DataFrame_Headers>();
  static DataFrame_Headers getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame_Headers _defaultInstance;

  $core.String get path => $_getS(0, '');
  set path($core.String v) { $_setString(0, v); }
  $core.bool hasPath() => $_has(0);
  void clearPath() => clearField(1);

  $core.String get status => $_getS(1, '');
  set status($core.String v) { $_setString(1, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  $core.String get rpcStatus => $_getS(2, '');
  set rpcStatus($core.String v) { $_setString(2, v); }
  $core.bool hasRpcStatus() => $_has(2);
  void clearRpcStatus() => clearField(3);

  $core.String get rpcMessage => $_getS(3, '');
  set rpcMessage($core.String v) { $_setString(3, v); }
  $core.bool hasRpcMessage() => $_has(3);
  void clearRpcMessage() => clearField(4);
}

class DataFrame_Trailers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DataFrame.Trailers', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Trailers._() : super();
  factory DataFrame_Trailers() => create();
  factory DataFrame_Trailers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame_Trailers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DataFrame_Trailers clone() => DataFrame_Trailers()..mergeFromMessage(this);
  DataFrame_Trailers copyWith(void Function(DataFrame_Trailers) updates) => super.copyWith((message) => updates(message as DataFrame_Trailers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame_Trailers create() => DataFrame_Trailers._();
  DataFrame_Trailers createEmptyInstance() => create();
  static $pb.PbList<DataFrame_Trailers> createRepeated() => $pb.PbList<DataFrame_Trailers>();
  static DataFrame_Trailers getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame_Trailers _defaultInstance;

  $core.String get path => $_getS(0, '');
  set path($core.String v) { $_setString(0, v); }
  $core.bool hasPath() => $_has(0);
  void clearPath() => clearField(1);

  $core.String get status => $_getS(1, '');
  set status($core.String v) { $_setString(1, v); }
  $core.bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  $core.String get rpcStatus => $_getS(2, '');
  set rpcStatus($core.String v) { $_setString(2, v); }
  $core.bool hasRpcStatus() => $_has(2);
  void clearRpcStatus() => clearField(3);

  $core.String get rpcMessage => $_getS(3, '');
  set rpcMessage($core.String v) { $_setString(3, v); }
  $core.bool hasRpcMessage() => $_has(3);
  void clearRpcMessage() => clearField(4);
}

class DataFrame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DataFrame', package: const $pb.PackageName('wsgrpc'))
    ..a<$core.int>(1, 'streamId', $pb.PbFieldType.O3)
    ..aOB(2, 'endStream')
    ..e<DataFrame_Types>(3, 'type', $pb.PbFieldType.OE, DataFrame_Types.NOOP, DataFrame_Types.valueOf, DataFrame_Types.values)
    ..a<DataFrame_Headers>(4, 'headers', $pb.PbFieldType.OM, DataFrame_Headers.getDefault, DataFrame_Headers.create)
    ..a<DataFrame_Trailers>(5, 'trailers', $pb.PbFieldType.OM, DataFrame_Trailers.getDefault, DataFrame_Trailers.create)
    ..a<$core.List<$core.int>>(6, 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DataFrame._() : super();
  factory DataFrame() => create();
  factory DataFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DataFrame clone() => DataFrame()..mergeFromMessage(this);
  DataFrame copyWith(void Function(DataFrame) updates) => super.copyWith((message) => updates(message as DataFrame));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame create() => DataFrame._();
  DataFrame createEmptyInstance() => create();
  static $pb.PbList<DataFrame> createRepeated() => $pb.PbList<DataFrame>();
  static DataFrame getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame _defaultInstance;

  $core.int get streamId => $_get(0, 0);
  set streamId($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasStreamId() => $_has(0);
  void clearStreamId() => clearField(1);

  $core.bool get endStream => $_get(1, false);
  set endStream($core.bool v) { $_setBool(1, v); }
  $core.bool hasEndStream() => $_has(1);
  void clearEndStream() => clearField(2);

  DataFrame_Types get type => $_getN(2);
  set type(DataFrame_Types v) { setField(3, v); }
  $core.bool hasType() => $_has(2);
  void clearType() => clearField(3);

  DataFrame_Headers get headers => $_getN(3);
  set headers(DataFrame_Headers v) { setField(4, v); }
  $core.bool hasHeaders() => $_has(3);
  void clearHeaders() => clearField(4);

  DataFrame_Trailers get trailers => $_getN(4);
  set trailers(DataFrame_Trailers v) { setField(5, v); }
  $core.bool hasTrailers() => $_has(4);
  void clearTrailers() => clearField(5);

  $core.List<$core.int> get message => $_getN(5);
  set message($core.List<$core.int> v) { $_setBytes(5, v); }
  $core.bool hasMessage() => $_has(5);
  void clearMessage() => clearField(6);
}

class Endponit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Endponit', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'url')
    ..hasRequiredFields = false
  ;

  Endponit._() : super();
  factory Endponit() => create();
  factory Endponit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Endponit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Endponit clone() => Endponit()..mergeFromMessage(this);
  Endponit copyWith(void Function(Endponit) updates) => super.copyWith((message) => updates(message as Endponit));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Endponit create() => Endponit._();
  Endponit createEmptyInstance() => create();
  static $pb.PbList<Endponit> createRepeated() => $pb.PbList<Endponit>();
  static Endponit getDefault() => _defaultInstance ??= create()..freeze();
  static Endponit _defaultInstance;

  $core.String get url => $_getS(0, '');
  set url($core.String v) { $_setString(0, v); }
  $core.bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);
}

