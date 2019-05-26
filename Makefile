
proto-wsgrpc:
	# pub global activate protoc_plugin
	protoc -I lib/protos/ lib/protos/wsgrpc.proto --dart_out=grpc:lib/generated
