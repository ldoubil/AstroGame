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

@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = {
  '1': 'MessageType',
  '2': [
    {'1': 'TEXT', '2': 0},
    {'1': 'IMAGE', '2': 1},
    {'1': 'SYSTEM', '2': 2},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlVHlwZRIICgRURVhUEAASCQoFSU1BR0UQARIKCgZTWVNURU0QAg==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'virtual_ip', '3': 3, '4': 1, '5': 9, '10': 'virtualIp'},
    {'1': 'tags', '3': 4, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'current_game', '3': 5, '4': 1, '5': 9, '10': 'currentGame'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm'
    '5hbWUSHQoKdmlydHVhbF9pcBgDIAEoCVIJdmlydHVhbElwEhIKBHRhZ3MYBCADKAlSBHRhZ3MS'
    'IQoMY3VycmVudF9nYW1lGAUgASgJUgtjdXJyZW50R2FtZQ==');

@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'last_heartbeat', '3': 4, '4': 1, '5': 3, '10': 'lastHeartbeat'},
    {'1': 'can_relay', '3': 5, '4': 1, '5': 8, '10': 'canRelay'},
  ],
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySW'
    'QSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcxIlCg5sYXN0X2hlYXJ0YmVhdBgEIAEoA1INbGFz'
    'dEhlYXJ0YmVhdBIbCgljYW5fcmVsYXkYBSABKAhSCGNhblJlbGF5');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'sender_id', '3': 2, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.chat.MessageType', '10': 'type'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'sent_at', '3': 5, '4': 1, '5': 3, '10': 'sentAt'},
    {'1': 'signature', '3': 6, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZBIbCglzZW5kZXJfaWQYAi'
    'ABKAlSCHNlbmRlcklkEiUKBHR5cGUYAyABKA4yES5jaGF0Lk1lc3NhZ2VUeXBlUgR0eXBlEhgK'
    'B2NvbnRlbnQYBCABKAlSB2NvbnRlbnQSFwoHc2VudF9hdBgFIAEoA1IGc2VudEF0EhwKCXNpZ2'
    '5hdHVyZRgGIAEoCVIJc2lnbmF0dXJl');

@$core.Deprecated('Use heartbeatRequestDescriptor instead')
const HeartbeatRequest$json = {
  '1': 'HeartbeatRequest',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'user_info', '3': 2, '4': 1, '5': 11, '6': '.chat.User', '10': 'userInfo'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `HeartbeatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatRequestDescriptor = $convert.base64Decode(
    'ChBIZWFydGJlYXRSZXF1ZXN0EhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBInCgl1c2VyX2luZm'
    '8YAiABKAsyCi5jaGF0LlVzZXJSCHVzZXJJbmZvEhwKCXRpbWVzdGFtcBgDIAEoA1IJdGltZXN0'
    'YW1w');

@$core.Deprecated('Use heartbeatResponseDescriptor instead')
const HeartbeatResponse$json = {
  '1': 'HeartbeatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'server_time', '3': 2, '4': 1, '5': 3, '10': 'serverTime'},
    {'1': 'active_users', '3': 3, '4': 3, '5': 11, '6': '.chat.User', '10': 'activeUsers'},
  ],
};

/// Descriptor for `HeartbeatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatResponseDescriptor = $convert.base64Decode(
    'ChFIZWFydGJlYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh8KC3NlcnZlcl'
    '90aW1lGAIgASgDUgpzZXJ2ZXJUaW1lEi0KDGFjdGl2ZV91c2VycxgDIAMoCzIKLmNoYXQuVXNl'
    'clILYWN0aXZlVXNlcnM=');

@$core.Deprecated('Use channelJoinNotificationDescriptor instead')
const ChannelJoinNotification$json = {
  '1': 'ChannelJoinNotification',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.chat.User', '10': 'user'},
    {'1': 'node', '3': 2, '4': 1, '5': 11, '6': '.chat.Node', '10': 'node'},
  ],
};

/// Descriptor for `ChannelJoinNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelJoinNotificationDescriptor = $convert.base64Decode(
    'ChdDaGFubmVsSm9pbk5vdGlmaWNhdGlvbhIeCgR1c2VyGAEgASgLMgouY2hhdC5Vc2VyUgR1c2'
    'VyEh4KBG5vZGUYAiABKAsyCi5jaGF0Lk5vZGVSBG5vZGU=');

@$core.Deprecated('Use channelLeaveNotificationDescriptor instead')
const ChannelLeaveNotification$json = {
  '1': 'ChannelLeaveNotification',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'node_id', '3': 2, '4': 1, '5': 9, '10': 'nodeId'},
  ],
};

/// Descriptor for `ChannelLeaveNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelLeaveNotificationDescriptor = $convert.base64Decode(
    'ChhDaGFubmVsTGVhdmVOb3RpZmljYXRpb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhcKB2'
    '5vZGVfaWQYAiABKAlSBm5vZGVJZA==');

@$core.Deprecated('Use streamMessageDescriptor instead')
const StreamMessage$json = {
  '1': 'StreamMessage',
  '2': [
    {'1': 'chat_message', '3': 1, '4': 1, '5': 11, '6': '.chat.Message', '9': 0, '10': 'chatMessage'},
    {'1': 'user_status', '3': 2, '4': 1, '5': 11, '6': '.chat.User', '9': 0, '10': 'userStatus'},
    {'1': 'join', '3': 3, '4': 1, '5': 11, '6': '.chat.ChannelJoinNotification', '9': 0, '10': 'join'},
    {'1': 'leave', '3': 4, '4': 1, '5': 11, '6': '.chat.ChannelLeaveNotification', '9': 0, '10': 'leave'},
    {'1': 'heartbeat', '3': 5, '4': 1, '5': 11, '6': '.chat.HeartbeatRequest', '9': 0, '10': 'heartbeat'},
    {'1': 'heartbeat_ack', '3': 6, '4': 1, '5': 11, '6': '.chat.HeartbeatResponse', '9': 0, '10': 'heartbeatAck'},
    {'1': 'timestamp', '3': 7, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'node_id', '3': 8, '4': 1, '5': 9, '10': 'nodeId'},
  ],
  '8': [
    {'1': 'message_type'},
  ],
};

/// Descriptor for `StreamMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMessageDescriptor = $convert.base64Decode(
    'Cg1TdHJlYW1NZXNzYWdlEjIKDGNoYXRfbWVzc2FnZRgBIAEoCzINLmNoYXQuTWVzc2FnZUgAUg'
    'tjaGF0TWVzc2FnZRItCgt1c2VyX3N0YXR1cxgCIAEoCzIKLmNoYXQuVXNlckgAUgp1c2VyU3Rh'
    'dHVzEjMKBGpvaW4YAyABKAsyHS5jaGF0LkNoYW5uZWxKb2luTm90aWZpY2F0aW9uSABSBGpvaW'
    '4SNgoFbGVhdmUYBCABKAsyHi5jaGF0LkNoYW5uZWxMZWF2ZU5vdGlmaWNhdGlvbkgAUgVsZWF2'
    'ZRI2CgloZWFydGJlYXQYBSABKAsyFi5jaGF0LkhlYXJ0YmVhdFJlcXVlc3RIAFIJaGVhcnRiZW'
    'F0Ej4KDWhlYXJ0YmVhdF9hY2sYBiABKAsyFy5jaGF0LkhlYXJ0YmVhdFJlc3BvbnNlSABSDGhl'
    'YXJ0YmVhdEFjaxIcCgl0aW1lc3RhbXAYByABKANSCXRpbWVzdGFtcBIXCgdub2RlX2lkGAggAS'
    'gJUgZub2RlSWRCDgoMbWVzc2FnZV90eXBl');

