///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

import 'wsgrpc.pbenum.dart';

export 'wsgrpc.pbenum.dart';

class DataFrame_Headers extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DataFrame_Headers')
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Headers() : super();
  DataFrame_Headers.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame_Headers.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame_Headers clone() => new DataFrame_Headers()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DataFrame_Headers create() => new DataFrame_Headers();
  static PbList<DataFrame_Headers> createRepeated() => new PbList<DataFrame_Headers>();
  static DataFrame_Headers getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDataFrame_Headers();
    return _defaultInstance;
  }
  static DataFrame_Headers _defaultInstance;
  static void $checkItem(DataFrame_Headers v) {
    if (v is! DataFrame_Headers) checkItemFailed(v, 'DataFrame_Headers');
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

class _ReadonlyDataFrame_Headers extends DataFrame_Headers with ReadonlyMessageMixin {}

class DataFrame_Trailers extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DataFrame_Trailers')
    ..aOS(1, 'path')
    ..aOS(2, 'status')
    ..aOS(3, 'rpcStatus')
    ..aOS(4, 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Trailers() : super();
  DataFrame_Trailers.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame_Trailers.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame_Trailers clone() => new DataFrame_Trailers()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DataFrame_Trailers create() => new DataFrame_Trailers();
  static PbList<DataFrame_Trailers> createRepeated() => new PbList<DataFrame_Trailers>();
  static DataFrame_Trailers getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDataFrame_Trailers();
    return _defaultInstance;
  }
  static DataFrame_Trailers _defaultInstance;
  static void $checkItem(DataFrame_Trailers v) {
    if (v is! DataFrame_Trailers) checkItemFailed(v, 'DataFrame_Trailers');
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

class _ReadonlyDataFrame_Trailers extends DataFrame_Trailers with ReadonlyMessageMixin {}

class DataFrame extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DataFrame')
    ..a<int>(1, 'streamId', PbFieldType.O3)
    ..aOB(2, 'endStream')
    ..e<DataFrame_Types>(3, 'type', PbFieldType.OE, DataFrame_Types.NOOP, DataFrame_Types.valueOf, DataFrame_Types.values)
    ..a<DataFrame_Headers>(4, 'headers', PbFieldType.OM, DataFrame_Headers.getDefault, DataFrame_Headers.create)
    ..a<DataFrame_Trailers>(5, 'trailers', PbFieldType.OM, DataFrame_Trailers.getDefault, DataFrame_Trailers.create)
    ..a<List<int>>(6, 'message', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DataFrame() : super();
  DataFrame.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DataFrame.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DataFrame clone() => new DataFrame()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DataFrame create() => new DataFrame();
  static PbList<DataFrame> createRepeated() => new PbList<DataFrame>();
  static DataFrame getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDataFrame();
    return _defaultInstance;
  }
  static DataFrame _defaultInstance;
  static void $checkItem(DataFrame v) {
    if (v is! DataFrame) checkItemFailed(v, 'DataFrame');
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

class _ReadonlyDataFrame extends DataFrame with ReadonlyMessageMixin {}

class Endponit extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Endponit')
    ..aOS(1, 'url')
    ..hasRequiredFields = false
  ;

  Endponit() : super();
  Endponit.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Endponit.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Endponit clone() => new Endponit()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Endponit create() => new Endponit();
  static PbList<Endponit> createRepeated() => new PbList<Endponit>();
  static Endponit getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyEndponit();
    return _defaultInstance;
  }
  static Endponit _defaultInstance;
  static void $checkItem(Endponit v) {
    if (v is! Endponit) checkItemFailed(v, 'Endponit');
  }

  String get url => $_getS(0, '');
  set url(String v) { $_setString(0, v); }
  bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);
}

class _ReadonlyEndponit extends Endponit with ReadonlyMessageMixin {}

