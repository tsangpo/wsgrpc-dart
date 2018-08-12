
proto-wsgrpc:
	protoc -I lib/protos/ lib/protos/wsgrpc.proto --dart_out=grpc:lib/generated
