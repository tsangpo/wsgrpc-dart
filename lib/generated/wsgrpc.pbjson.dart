///
//  Generated code. Do not modify.
//  source: wsgrpc.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

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

const DataFrame_Headers$json = const {
  '1': 'Headers',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'rpc_status', '3': 3, '4': 1, '5': 9, '10': 'rpcStatus'},
    const {'1': 'rpc_message', '3': 4, '4': 1, '5': 9, '10': 'rpcMessage'},
  ],
};

const DataFrame_Trailers$json = const {
  '1': 'Trailers',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'rpc_status', '3': 3, '4': 1, '5': 9, '10': 'rpcStatus'},
    const {'1': 'rpc_message', '3': 4, '4': 1, '5': 9, '10': 'rpcMessage'},
  ],
};

const DataFrame_Types$json = const {
  '1': 'Types',
  '2': const [
    const {'1': 'NOOP', '2': 0},
    const {'1': 'HEADERS', '2': 1},
    const {'1': 'TRAILERS', '2': 2},
    const {'1': 'MESSAGE', '2': 3},
  ],
};

const Endponit$json = const {
  '1': 'Endponit',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

