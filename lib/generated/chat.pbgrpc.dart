//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.P2PChatService')
class P2PChatServiceClient extends $grpc.Client {
  static final _$bidirectionalStream = $grpc.ClientMethod<$0.StreamMessage, $0.StreamMessage>(
      '/chat.P2PChatService/BidirectionalStream',
      ($0.StreamMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamMessage.fromBuffer(value));

  P2PChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.StreamMessage> bidirectionalStream($async.Stream<$0.StreamMessage> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bidirectionalStream, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.P2PChatService')
abstract class P2PChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.P2PChatService';

  P2PChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StreamMessage, $0.StreamMessage>(
        'BidirectionalStream',
        bidirectionalStream,
        true,
        true,
        ($core.List<$core.int> value) => $0.StreamMessage.fromBuffer(value),
        ($0.StreamMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.StreamMessage> bidirectionalStream($grpc.ServiceCall call, $async.Stream<$0.StreamMessage> request);
}
