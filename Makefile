
proto-wsgrpc:
	# pub global activate protoc_plugin
	protoc -I lib/protos/ lib/protos/data.proto --dart_out=grpc:lib/generated

test:
	protoc -I example/protos/ example/protos/route_guide.proto --dart_out=grpc:example/protos/generated/
	dart example/route_guide.dart
