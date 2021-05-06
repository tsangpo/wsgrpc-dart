///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use dataFrameDescriptor instead')
const DataFrame$json = const {
  '1': 'DataFrame',
  '2': const [
    const {'1': 'stream_id', '3': 1, '4': 1, '5': 5, '10': 'streamId'},
    const {'1': 'end_stream', '3': 2, '4': 1, '5': 8, '10': 'endStream'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.wsgrpc.DataFrame.Types', '10': 'type'},
    const {'1': 'headers', '3': 4, '4': 1, '5': 11, '6': '.wsgrpc.DataFrame.Headers', '10': 'headers'},
    const {'1': 'trailers', '3': 5, '4': 1, '5': 11, '6': '.wsgrpc.DataFrame.Trailers', '10': 'trailers'},
    const {'1': 'message', '3': 6, '4': 1, '5': 12, '10': 'message'},
  ],
  '3': const [DataFrame_Headers$json, DataFrame_Trailers$json],
  '4': const [DataFrame_Types$json],
};

@$core.Deprecated('Use dataFrameDescriptor instead')
const DataFrame_Headers$json = const {
  '1': 'Headers',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'rpc_status', '3': 3, '4': 1, '5': 9, '10': 'rpcStatus'},
    const {'1': 'rpc_message', '3': 4, '4': 1, '5': 9, '10': 'rpcMessage'},
  ],
};

@$core.Deprecated('Use dataFrameDescriptor instead')
const DataFrame_Trailers$json = const {
  '1': 'Trailers',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'rpc_status', '3': 3, '4': 1, '5': 9, '10': 'rpcStatus'},
    const {'1': 'rpc_message', '3': 4, '4': 1, '5': 9, '10': 'rpcMessage'},
  ],
};

@$core.Deprecated('Use dataFrameDescriptor instead')
const DataFrame_Types$json = const {
  '1': 'Types',
  '2': const [
    const {'1': 'NOOP', '2': 0},
    const {'1': 'HEADERS', '2': 1},
    const {'1': 'TRAILERS', '2': 2},
    const {'1': 'MESSAGE', '2': 3},
  ],
};

/// Descriptor for `DataFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataFrameDescriptor = $convert.base64Decode('CglEYXRhRnJhbWUSGwoJc3RyZWFtX2lkGAEgASgFUghzdHJlYW1JZBIdCgplbmRfc3RyZWFtGAIgASgIUgllbmRTdHJlYW0SKwoEdHlwZRgDIAEoDjIXLndzZ3JwYy5EYXRhRnJhbWUuVHlwZXNSBHR5cGUSMwoHaGVhZGVycxgEIAEoCzIZLndzZ3JwYy5EYXRhRnJhbWUuSGVhZGVyc1IHaGVhZGVycxI2Cgh0cmFpbGVycxgFIAEoCzIaLndzZ3JwYy5EYXRhRnJhbWUuVHJhaWxlcnNSCHRyYWlsZXJzEhgKB21lc3NhZ2UYBiABKAxSB21lc3NhZ2UadQoHSGVhZGVycxISCgRwYXRoGAEgASgJUgRwYXRoEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVzEh0KCnJwY19zdGF0dXMYAyABKAlSCXJwY1N0YXR1cxIfCgtycGNfbWVzc2FnZRgEIAEoCVIKcnBjTWVzc2FnZRp2CghUcmFpbGVycxISCgRwYXRoGAEgASgJUgRwYXRoEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVzEh0KCnJwY19zdGF0dXMYAyABKAlSCXJwY1N0YXR1cxIfCgtycGNfbWVzc2FnZRgEIAEoCVIKcnBjTWVzc2FnZSI5CgVUeXBlcxIICgROT09QEAASCwoHSEVBREVSUxABEgwKCFRSQUlMRVJTEAISCwoHTUVTU0FHRRAD');
@$core.Deprecated('Use endponitDescriptor instead')
const Endponit$json = const {
  '1': 'Endponit',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Endponit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endponitDescriptor = $convert.base64Decode('CghFbmRwb25pdBIQCgN1cmwYASABKAlSA3VybA==');
