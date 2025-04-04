//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use playerDescriptor instead')
const Player$json = {
  '1': 'Player',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_host', '3': 3, '4': 1, '5': 8, '10': 'isHost'},
    {'1': 'is_connected', '3': 4, '4': 1, '5': 8, '10': 'isConnected'},
  ],
};

/// Descriptor for `Player`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDescriptor = $convert.base64Decode(
    'CgZQbGF5ZXISGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhcKB2lzX2hvc3QYAyABKAhSBmlzSG9zdBIhCgxpc19jb25uZWN0ZWQYBCABKAhSC2lzQ29u'
    'bmVjdGVk');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'sender_id', '3': 4, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'sender_name', '3': 5, '4': 1, '5': 9, '10': 'senderName'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYWdlSWQSGAoHY29udGVudB'
    'gCIAEoCVIHY29udGVudBIcCgl0aW1lc3RhbXAYAyABKANSCXRpbWVzdGFtcBIbCglzZW5kZXJf'
    'aWQYBCABKAlSCHNlbmRlcklkEh8KC3NlbmRlcl9uYW1lGAUgASgJUgpzZW5kZXJOYW1l');

@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = {
  '1': 'SendMessageRequest',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    {'1': 'target_player_id', '3': 2, '4': 1, '5': 9, '10': 'targetPlayerId'},
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode(
    'ChJTZW5kTWVzc2FnZVJlcXVlc3QSGAoHY29udGVudBgBIAEoCVIHY29udGVudBIoChB0YXJnZX'
    'RfcGxheWVyX2lkGAIgASgJUg50YXJnZXRQbGF5ZXJJZA==');

@$core.Deprecated('Use sendMessageResponseDescriptor instead')
const SendMessageResponse$json = {
  '1': 'SendMessageResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'message', '3': 3, '4': 1, '5': 11, '6': '.chat.ChatMessage', '10': 'message'},
  ],
};

/// Descriptor for `SendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageResponseDescriptor = $convert.base64Decode(
    'ChNTZW5kTWVzc2FnZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIwoNZXJyb3'
    'JfbWVzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdlEisKB21lc3NhZ2UYAyABKAsyES5jaGF0LkNo'
    'YXRNZXNzYWdlUgdtZXNzYWdl');

@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = {
  '1': 'GetMessagesRequest',
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode(
    'ChJHZXRNZXNzYWdlc1JlcXVlc3Q=');

@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = {
  '1': 'GetMessagesResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatMessage', '10': 'messages'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode(
    'ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEi0KCG1lc3NhZ2VzGAEgAygLMhEuY2hhdC5DaGF0TWVzc2'
    'FnZVIIbWVzc2FnZXM=');

@$core.Deprecated('Use joinGameRequestDescriptor instead')
const JoinGameRequest$json = {
  '1': 'JoinGameRequest',
  '2': [
    {'1': 'player', '3': 1, '4': 1, '5': 11, '6': '.chat.Player', '10': 'player'},
  ],
};

/// Descriptor for `JoinGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinGameRequestDescriptor = $convert.base64Decode(
    'Cg9Kb2luR2FtZVJlcXVlc3QSJAoGcGxheWVyGAEgASgLMgwuY2hhdC5QbGF5ZXJSBnBsYXllcg'
    '==');

@$core.Deprecated('Use joinGameResponseDescriptor instead')
const JoinGameResponse$json = {
  '1': 'JoinGameResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'players', '3': 3, '4': 3, '5': 11, '6': '.chat.Player', '10': 'players'},
  ],
};

/// Descriptor for `JoinGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinGameResponseDescriptor = $convert.base64Decode(
    'ChBKb2luR2FtZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIwoNZXJyb3JfbW'
    'Vzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdlEiYKB3BsYXllcnMYAyADKAsyDC5jaGF0LlBsYXll'
    'clIHcGxheWVycw==');

@$core.Deprecated('Use leaveGameRequestDescriptor instead')
const LeaveGameRequest$json = {
  '1': 'LeaveGameRequest',
  '2': [
    {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `LeaveGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveGameRequestDescriptor = $convert.base64Decode(
    'ChBMZWF2ZUdhbWVSZXF1ZXN0EhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQ=');

@$core.Deprecated('Use leaveGameResponseDescriptor instead')
const LeaveGameResponse$json = {
  '1': 'LeaveGameResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LeaveGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveGameResponseDescriptor = $convert.base64Decode(
    'ChFMZWF2ZUdhbWVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use getPlayersRequestDescriptor instead')
const GetPlayersRequest$json = {
  '1': 'GetPlayersRequest',
};

/// Descriptor for `GetPlayersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayersRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQbGF5ZXJzUmVxdWVzdA==');

@$core.Deprecated('Use getPlayersResponseDescriptor instead')
const GetPlayersResponse$json = {
  '1': 'GetPlayersResponse',
  '2': [
    {'1': 'players', '3': 1, '4': 3, '5': 11, '6': '.chat.Player', '10': 'players'},
  ],
};

/// Descriptor for `GetPlayersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlayersResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQbGF5ZXJzUmVzcG9uc2USJgoHcGxheWVycxgBIAMoCzIMLmNoYXQuUGxheWVyUgdwbG'
    'F5ZXJz');

@$core.Deprecated('Use hostChangeNotificationDescriptor instead')
const HostChangeNotification$json = {
  '1': 'HostChangeNotification',
  '2': [
    {'1': 'new_host_id', '3': 1, '4': 1, '5': 9, '10': 'newHostId'},
    {'1': 'new_host_name', '3': 2, '4': 1, '5': 9, '10': 'newHostName'},
  ],
};

/// Descriptor for `HostChangeNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostChangeNotificationDescriptor = $convert.base64Decode(
    'ChZIb3N0Q2hhbmdlTm90aWZpY2F0aW9uEh4KC25ld19ob3N0X2lkGAEgASgJUgluZXdIb3N0SW'
    'QSIgoNbmV3X2hvc3RfbmFtZRgCIAEoCVILbmV3SG9zdE5hbWU=');

