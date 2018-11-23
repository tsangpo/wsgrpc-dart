///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wsgrpc.pbenum.dart';

export 'wsgrpc.pbenum.dart';

class DataFrame_Headers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('DataFrame.Headers', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Headers() : super();
  DataFrame_Headers.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame_Headers.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame_Headers clone() => new DataFrame_Headers()..mergeFromMessage(this);
  DataFrame_Headers copyWith(void Function(DataFrame_Headers) updates) => super.copyWith((message) => updates(message as DataFrame_Headers));
  $pb.BuilderInfo get info_ => _i;
  static DataFrame_Headers create() => new DataFrame_Headers();
  static $pb.PbList<DataFrame_Headers> createRepeated() => new $pb.PbList<DataFrame_Headers>();
  static DataFrame_Headers getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame_Headers _defaultInstance;
  static void $checkItem(DataFrame_Headers v) {
    if (v is! DataFrame_Headers) $pb.checkItemFailed(v, _i.messageName);
  }

  String get path => $_getS(0, '');
  set path(String v) { $_setString(0, v); }
  bool hasPath() => $_has(0);
  void clearPath() => clearField(1);

  String get status => $_getS(1, '');
  set status(String v) { $_setString(1, v); }
  bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  String get rpcStatus => $_getS(2, '');
  set rpcStatus(String v) { $_setString(2, v); }
  bool hasRpcStatus() => $_has(2);
  void clearRpcStatus() => clearField(3);

  String get rpcMessage => $_getS(3, '');
  set rpcMessage(String v) { $_setString(3, v); }
  bool hasRpcMessage() => $_has(3);
  void clearRpcMessage() => clearField(4);
}

class DataFrame_Trailers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('DataFrame.Trailers', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Trailers() : super();
  DataFrame_Trailers.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame_Trailers.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame_Trailers clone() => new DataFrame_Trailers()..mergeFromMessage(this);
  DataFrame_Trailers copyWith(void Function(DataFrame_Trailers) updates) => super.copyWith((message) => updates(message as DataFrame_Trailers));
  $pb.BuilderInfo get info_ => _i;
  static DataFrame_Trailers create() => new DataFrame_Trailers();
  static $pb.PbList<DataFrame_Trailers> createRepeated() => new $pb.PbList<DataFrame_Trailers>();
  static DataFrame_Trailers getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame_Trailers _defaultInstance;
  static void $checkItem(DataFrame_Trailers v) {
    if (v is! DataFrame_Trailers) $pb.checkItemFailed(v, _i.messageName);
  }

  String get path => $_getS(0, '');
  set path(String v) { $_setString(0, v); }
  bool hasPath() => $_has(0);
  void clearPath() => clearField(1);

  String get status => $_getS(1, '');
  set status(String v) { $_setString(1, v); }
  bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  String get rpcStatus => $_getS(2, '');
  set rpcStatus(String v) { $_setString(2, v); }
  bool hasRpcStatus() => $_has(2);
  void clearRpcStatus() => clearField(3);

  String get rpcMessage => $_getS(3, '');
  set rpcMessage(String v) { $_setString(3, v); }
  bool hasRpcMessage() => $_has(3);
  void clearRpcMessage() => clearField(4);
}

class DataFrame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('DataFrame', package: const $pb.PackageName('wsgrpc'))
    ..a<int>(1, 'streamId', $pb.PbFieldType.O3)
    ..aOB(2, 'endStream')
    ..e<DataFrame_Types>(3, 'type', $pb.PbFieldType.OE, DataFrame_Types.NOOP, DataFrame_Types.valueOf, DataFrame_Types.values)
    ..a<DataFrame_Headers>(4, 'headers', $pb.PbFieldType.OM, DataFrame_Headers.getDefault, DataFrame_Headers.create)
    ..a<DataFrame_Trailers>(5, 'trailers', $pb.PbFieldType.OM, DataFrame_Trailers.getDefault, DataFrame_Trailers.create)
    ..a<List<int>>(6, 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DataFrame() : super();
  DataFrame.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame clone() => new DataFrame()..mergeFromMessage(this);
  DataFrame copyWith(void Function(DataFrame) updates) => super.copyWith((message) => updates(message as DataFrame));
  $pb.BuilderInfo get info_ => _i;
  static DataFrame create() => new DataFrame();
  static $pb.PbList<DataFrame> createRepeated() => new $pb.PbList<DataFrame>();
  static DataFrame getDefault() => _defaultInstance ??= create()..freeze();
  static DataFrame _defaultInstance;
  static void $checkItem(DataFrame v) {
    if (v is! DataFrame) $pb.checkItemFailed(v, _i.messageName);
  }

  int get streamId => $_get(0, 0);
  set streamId(int v) { $_setSignedInt32(0, v); }
  bool hasStreamId() => $_has(0);
  void clearStreamId() => clearField(1);

  bool get endStream => $_get(1, false);
  set endStream(bool v) { $_setBool(1, v); }
  bool hasEndStream() => $_has(1);
  void clearEndStream() => clearField(2);

  DataFrame_Types get type => $_getN(2);
  set type(DataFrame_Types v) { setField(3, v); }
  bool hasType() => $_has(2);
  void clearType() => clearField(3);

  DataFrame_Headers get headers => $_getN(3);
  set headers(DataFrame_Headers v) { setField(4, v); }
  bool hasHeaders() => $_has(3);
  void clearHeaders() => clearField(4);

  DataFrame_Trailers get trailers => $_getN(4);
  set trailers(DataFrame_Trailers v) { setField(5, v); }
  bool hasTrailers() => $_has(4);
  void clearTrailers() => clearField(5);

  List<int> get message => $_getN(5);
  set message(List<int> v) { $_setBytes(5, v); }
  bool hasMessage() => $_has(5);
  void clearMessage() => clearField(6);
}

class Endponit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Endponit', package: const $pb.PackageName('wsgrpc'))
    ..aOS(1, 'url')
    ..hasRequiredFields = false
  ;

  Endponit() : super();
  Endponit.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Endponit.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Endponit clone() => new Endponit()..mergeFromMessage(this);
  Endponit copyWith(void Function(Endponit) updates) => super.copyWith((message) => updates(message as Endponit));
  $pb.BuilderInfo get info_ => _i;
  static Endponit create() => new Endponit();
  static $pb.PbList<Endponit> createRepeated() => new $pb.PbList<Endponit>();
  static Endponit getDefault() => _defaultInstance ??= create()..freeze();
  static Endponit _defaultInstance;
  static void $checkItem(Endponit v) {
    if (v is! Endponit) $pb.checkItemFailed(v, _i.messageName);
  }

  String get url => $_getS(0, '');
  set url(String v) { $_setString(0, v); }
  bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);
}

