///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'wsgrpc.pbenum.dart';

export 'wsgrpc.pbenum.dart';

class DataFrame_Headers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataFrame.Headers', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'wsgrpc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rpcStatus')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Headers._() : super();
  factory DataFrame_Headers({
    $core.String? path,
    $core.String? status,
    $core.String? rpcStatus,
    $core.String? rpcMessage,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (status != null) {
      _result.status = status;
    }
    if (rpcStatus != null) {
      _result.rpcStatus = rpcStatus;
    }
    if (rpcMessage != null) {
      _result.rpcMessage = rpcMessage;
    }
    return _result;
  }
  factory DataFrame_Headers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame_Headers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataFrame_Headers clone() => DataFrame_Headers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataFrame_Headers copyWith(void Function(DataFrame_Headers) updates) => super.copyWith((message) => updates(message as DataFrame_Headers)) as DataFrame_Headers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame_Headers create() => DataFrame_Headers._();
  DataFrame_Headers createEmptyInstance() => create();
  static $pb.PbList<DataFrame_Headers> createRepeated() => $pb.PbList<DataFrame_Headers>();
  @$core.pragma('dart2js:noInline')
  static DataFrame_Headers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataFrame_Headers>(create);
  static DataFrame_Headers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rpcStatus => $_getSZ(2);
  @$pb.TagNumber(3)
  set rpcStatus($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRpcStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearRpcStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rpcMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set rpcMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRpcMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearRpcMessage() => clearField(4);
}

class DataFrame_Trailers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataFrame.Trailers', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'wsgrpc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rpcStatus')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rpcMessage')
    ..hasRequiredFields = false
  ;

  DataFrame_Trailers._() : super();
  factory DataFrame_Trailers({
    $core.String? path,
    $core.String? status,
    $core.String? rpcStatus,
    $core.String? rpcMessage,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (status != null) {
      _result.status = status;
    }
    if (rpcStatus != null) {
      _result.rpcStatus = rpcStatus;
    }
    if (rpcMessage != null) {
      _result.rpcMessage = rpcMessage;
    }
    return _result;
  }
  factory DataFrame_Trailers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame_Trailers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataFrame_Trailers clone() => DataFrame_Trailers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataFrame_Trailers copyWith(void Function(DataFrame_Trailers) updates) => super.copyWith((message) => updates(message as DataFrame_Trailers)) as DataFrame_Trailers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame_Trailers create() => DataFrame_Trailers._();
  DataFrame_Trailers createEmptyInstance() => create();
  static $pb.PbList<DataFrame_Trailers> createRepeated() => $pb.PbList<DataFrame_Trailers>();
  @$core.pragma('dart2js:noInline')
  static DataFrame_Trailers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataFrame_Trailers>(create);
  static DataFrame_Trailers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rpcStatus => $_getSZ(2);
  @$pb.TagNumber(3)
  set rpcStatus($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRpcStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearRpcStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rpcMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set rpcMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRpcMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearRpcMessage() => clearField(4);
}

class DataFrame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataFrame', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'wsgrpc'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamId', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endStream')
    ..e<DataFrame_Types>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: DataFrame_Types.NOOP, valueOf: DataFrame_Types.valueOf, enumValues: DataFrame_Types.values)
    ..aOM<DataFrame_Headers>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', subBuilder: DataFrame_Headers.create)
    ..aOM<DataFrame_Trailers>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trailers', subBuilder: DataFrame_Trailers.create)
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  DataFrame._() : super();
  factory DataFrame({
    $core.int? streamId,
    $core.bool? endStream,
    DataFrame_Types? type,
    DataFrame_Headers? headers,
    DataFrame_Trailers? trailers,
    $core.List<$core.int>? message,
  }) {
    final _result = create();
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (endStream != null) {
      _result.endStream = endStream;
    }
    if (type != null) {
      _result.type = type;
    }
    if (headers != null) {
      _result.headers = headers;
    }
    if (trailers != null) {
      _result.trailers = trailers;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory DataFrame.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataFrame.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataFrame clone() => DataFrame()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataFrame copyWith(void Function(DataFrame) updates) => super.copyWith((message) => updates(message as DataFrame)) as DataFrame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataFrame create() => DataFrame._();
  DataFrame createEmptyInstance() => create();
  static $pb.PbList<DataFrame> createRepeated() => $pb.PbList<DataFrame>();
  @$core.pragma('dart2js:noInline')
  static DataFrame getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataFrame>(create);
  static DataFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get streamId => $_getIZ(0);
  @$pb.TagNumber(1)
  set streamId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get endStream => $_getBF(1);
  @$pb.TagNumber(2)
  set endStream($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndStream() => clearField(2);

  @$pb.TagNumber(3)
  DataFrame_Types get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(DataFrame_Types v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  DataFrame_Headers get headers => $_getN(3);
  @$pb.TagNumber(4)
  set headers(DataFrame_Headers v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeaders() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeaders() => clearField(4);
  @$pb.TagNumber(4)
  DataFrame_Headers ensureHeaders() => $_ensure(3);

  @$pb.TagNumber(5)
  DataFrame_Trailers get trailers => $_getN(4);
  @$pb.TagNumber(5)
  set trailers(DataFrame_Trailers v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTrailers() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrailers() => clearField(5);
  @$pb.TagNumber(5)
  DataFrame_Trailers ensureTrailers() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get message => $_getN(5);
  @$pb.TagNumber(6)
  set message($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => clearField(6);
}

class Endponit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Endponit', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'wsgrpc'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  Endponit._() : super();
  factory Endponit({
    $core.String? url,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory Endponit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Endponit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Endponit clone() => Endponit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Endponit copyWith(void Function(Endponit) updates) => super.copyWith((message) => updates(message as Endponit)) as Endponit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Endponit create() => Endponit._();
  Endponit createEmptyInstance() => create();
  static $pb.PbList<Endponit> createRepeated() => $pb.PbList<Endponit>();
  @$core.pragma('dart2js:noInline')
  static Endponit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Endponit>(create);
  static Endponit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}

