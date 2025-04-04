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

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$sendMessage = $grpc.ClientMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
      '/chat.ChatService/SendMessage',
      ($0.SendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendMessageResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
      '/chat.ChatService/GetMessages',
      ($0.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMessagesResponse.fromBuffer(value));
  static final _$subscribeToMessages = $grpc.ClientMethod<$0.GetMessagesRequest, $0.ChatMessage>(
      '/chat.ChatService/SubscribeToMessages',
      ($0.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));
  static final _$joinGame = $grpc.ClientMethod<$0.JoinGameRequest, $0.JoinGameResponse>(
      '/chat.ChatService/JoinGame',
      ($0.JoinGameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinGameResponse.fromBuffer(value));
  static final _$leaveGame = $grpc.ClientMethod<$0.LeaveGameRequest, $0.LeaveGameResponse>(
      '/chat.ChatService/LeaveGame',
      ($0.LeaveGameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LeaveGameResponse.fromBuffer(value));
  static final _$getPlayers = $grpc.ClientMethod<$0.GetPlayersRequest, $0.GetPlayersResponse>(
      '/chat.ChatService/GetPlayers',
      ($0.GetPlayersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPlayersResponse.fromBuffer(value));
  static final _$subscribeToPlayerChanges = $grpc.ClientMethod<$0.GetPlayersRequest, $0.Player>(
      '/chat.ChatService/SubscribeToPlayerChanges',
      ($0.GetPlayersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Player.fromBuffer(value));
  static final _$subscribeToHostChanges = $grpc.ClientMethod<$0.GetPlayersRequest, $0.HostChangeNotification>(
      '/chat.ChatService/SubscribeToHostChanges',
      ($0.GetPlayersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HostChangeNotification.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SendMessageResponse> sendMessage($0.SendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessagesResponse> getMessages($0.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseStream<$0.ChatMessage> subscribeToMessages($0.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToMessages, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.JoinGameResponse> joinGame($0.JoinGameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinGame, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaveGameResponse> leaveGame($0.LeaveGameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveGame, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPlayersResponse> getPlayers($0.GetPlayersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlayers, request, options: options);
  }

  $grpc.ResponseStream<$0.Player> subscribeToPlayerChanges($0.GetPlayersRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToPlayerChanges, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.HostChangeNotification> subscribeToHostChanges($0.GetPlayersRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToHostChanges, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendMessageRequest, $0.SendMessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendMessageRequest.fromBuffer(value),
        ($0.SendMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
        'GetMessages',
        getMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMessagesRequest.fromBuffer(value),
        ($0.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessagesRequest, $0.ChatMessage>(
        'SubscribeToMessages',
        subscribeToMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetMessagesRequest.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinGameRequest, $0.JoinGameResponse>(
        'JoinGame',
        joinGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinGameRequest.fromBuffer(value),
        ($0.JoinGameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaveGameRequest, $0.LeaveGameResponse>(
        'LeaveGame',
        leaveGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LeaveGameRequest.fromBuffer(value),
        ($0.LeaveGameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayersRequest, $0.GetPlayersResponse>(
        'GetPlayers',
        getPlayers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPlayersRequest.fromBuffer(value),
        ($0.GetPlayersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayersRequest, $0.Player>(
        'SubscribeToPlayerChanges',
        subscribeToPlayerChanges_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetPlayersRequest.fromBuffer(value),
        ($0.Player value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayersRequest, $0.HostChangeNotification>(
        'SubscribeToHostChanges',
        subscribeToHostChanges_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetPlayersRequest.fromBuffer(value),
        ($0.HostChangeNotification value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendMessageResponse> sendMessage_Pre($grpc.ServiceCall $call, $async.Future<$0.SendMessageRequest> $request) async {
    return sendMessage($call, await $request);
  }

  $async.Future<$0.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall $call, $async.Future<$0.GetMessagesRequest> $request) async {
    return getMessages($call, await $request);
  }

  $async.Stream<$0.ChatMessage> subscribeToMessages_Pre($grpc.ServiceCall $call, $async.Future<$0.GetMessagesRequest> $request) async* {
    yield* subscribeToMessages($call, await $request);
  }

  $async.Future<$0.JoinGameResponse> joinGame_Pre($grpc.ServiceCall $call, $async.Future<$0.JoinGameRequest> $request) async {
    return joinGame($call, await $request);
  }

  $async.Future<$0.LeaveGameResponse> leaveGame_Pre($grpc.ServiceCall $call, $async.Future<$0.LeaveGameRequest> $request) async {
    return leaveGame($call, await $request);
  }

  $async.Future<$0.GetPlayersResponse> getPlayers_Pre($grpc.ServiceCall $call, $async.Future<$0.GetPlayersRequest> $request) async {
    return getPlayers($call, await $request);
  }

  $async.Stream<$0.Player> subscribeToPlayerChanges_Pre($grpc.ServiceCall $call, $async.Future<$0.GetPlayersRequest> $request) async* {
    yield* subscribeToPlayerChanges($call, await $request);
  }

  $async.Stream<$0.HostChangeNotification> subscribeToHostChanges_Pre($grpc.ServiceCall $call, $async.Future<$0.GetPlayersRequest> $request) async* {
    yield* subscribeToHostChanges($call, await $request);
  }

  $async.Future<$0.SendMessageResponse> sendMessage($grpc.ServiceCall call, $0.SendMessageRequest request);
  $async.Future<$0.GetMessagesResponse> getMessages($grpc.ServiceCall call, $0.GetMessagesRequest request);
  $async.Stream<$0.ChatMessage> subscribeToMessages($grpc.ServiceCall call, $0.GetMessagesRequest request);
  $async.Future<$0.JoinGameResponse> joinGame($grpc.ServiceCall call, $0.JoinGameRequest request);
  $async.Future<$0.LeaveGameResponse> leaveGame($grpc.ServiceCall call, $0.LeaveGameRequest request);
  $async.Future<$0.GetPlayersResponse> getPlayers($grpc.ServiceCall call, $0.GetPlayersRequest request);
  $async.Stream<$0.Player> subscribeToPlayerChanges($grpc.ServiceCall call, $0.GetPlayersRequest request);
  $async.Stream<$0.HostChangeNotification> subscribeToHostChanges($grpc.ServiceCall call, $0.GetPlayersRequest request);
}
