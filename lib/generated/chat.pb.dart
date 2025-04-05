//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'chat.pbenum.dart';

/// 用户信息
class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? userId,
    $core.String? username,
    $core.String? virtualIp,
    $core.Iterable<$core.String>? tags,
    $core.String? currentGame,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (username != null) {
      $result.username = username;
    }
    if (virtualIp != null) {
      $result.virtualIp = virtualIp;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (currentGame != null) {
      $result.currentGame = currentGame;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'virtualIp')
    ..pPS(4, _omitFieldNames ? '' : 'tags')
    ..aOS(5, _omitFieldNames ? '' : 'currentGame')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get virtualIp => $_getSZ(2);
  @$pb.TagNumber(3)
  set virtualIp($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVirtualIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearVirtualIp() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get tags => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get currentGame => $_getSZ(4);
  @$pb.TagNumber(5)
  set currentGame($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrentGame() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentGame() => $_clearField(5);
}

/// 节点信息
class Node extends $pb.GeneratedMessage {
  factory Node({
    $core.String? nodeId,
    $core.String? userId,
    $core.String? address,
    $fixnum.Int64? lastHeartbeat,
    $core.bool? canRelay,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (address != null) {
      $result.address = address;
    }
    if (lastHeartbeat != null) {
      $result.lastHeartbeat = lastHeartbeat;
    }
    if (canRelay != null) {
      $result.canRelay = canRelay;
    }
    return $result;
  }
  Node._() : super();
  factory Node.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Node.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Node', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aInt64(4, _omitFieldNames ? '' : 'lastHeartbeat')
    ..aOB(5, _omitFieldNames ? '' : 'canRelay')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Node clone() => Node()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Node copyWith(void Function(Node) updates) => super.copyWith((message) => updates(message as Node)) as Node;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  Node createEmptyInstance() => create();
  static $pb.PbList<Node> createRepeated() => $pb.PbList<Node>();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastHeartbeat => $_getI64(3);
  @$pb.TagNumber(4)
  set lastHeartbeat($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastHeartbeat() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastHeartbeat() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canRelay => $_getBF(4);
  @$pb.TagNumber(5)
  set canRelay($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCanRelay() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanRelay() => $_clearField(5);
}

/// 消息内容
class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? messageId,
    $core.String? senderId,
    MessageType? type,
    $core.String? content,
    $fixnum.Int64? sentAt,
    $core.String? signature,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (senderId != null) {
      $result.senderId = senderId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (content != null) {
      $result.content = content;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'senderId')
    ..e<MessageType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MessageType.TEXT, valueOf: MessageType.valueOf, enumValues: MessageType.values)
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aInt64(5, _omitFieldNames ? '' : 'sentAt')
    ..aOS(6, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => $_clearField(2);

  @$pb.TagNumber(3)
  MessageType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(MessageType v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sentAt => $_getI64(4);
  @$pb.TagNumber(5)
  set sentAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSentAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearSentAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get signature => $_getSZ(5);
  @$pb.TagNumber(6)
  set signature($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearSignature() => $_clearField(6);
}

/// 节点心跳请求
class HeartbeatRequest extends $pb.GeneratedMessage {
  factory HeartbeatRequest({
    $core.String? nodeId,
    User? userInfo,
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (userInfo != null) {
      $result.userInfo = userInfo;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  HeartbeatRequest._() : super();
  factory HeartbeatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HeartbeatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aOM<User>(2, _omitFieldNames ? '' : 'userInfo', subBuilder: User.create)
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatRequest clone() => HeartbeatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatRequest copyWith(void Function(HeartbeatRequest) updates) => super.copyWith((message) => updates(message as HeartbeatRequest)) as HeartbeatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatRequest create() => HeartbeatRequest._();
  HeartbeatRequest createEmptyInstance() => create();
  static $pb.PbList<HeartbeatRequest> createRepeated() => $pb.PbList<HeartbeatRequest>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatRequest>(create);
  static HeartbeatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  User get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(User v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  User ensureUserInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

/// 节点心跳响应
class HeartbeatResponse extends $pb.GeneratedMessage {
  factory HeartbeatResponse({
    $core.bool? success,
    $fixnum.Int64? serverTime,
    $core.Iterable<User>? activeUsers,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (serverTime != null) {
      $result.serverTime = serverTime;
    }
    if (activeUsers != null) {
      $result.activeUsers.addAll(activeUsers);
    }
    return $result;
  }
  HeartbeatResponse._() : super();
  factory HeartbeatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartbeatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HeartbeatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aInt64(2, _omitFieldNames ? '' : 'serverTime')
    ..pc<User>(3, _omitFieldNames ? '' : 'activeUsers', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartbeatResponse clone() => HeartbeatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartbeatResponse copyWith(void Function(HeartbeatResponse) updates) => super.copyWith((message) => updates(message as HeartbeatResponse)) as HeartbeatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatResponse create() => HeartbeatResponse._();
  HeartbeatResponse createEmptyInstance() => create();
  static $pb.PbList<HeartbeatResponse> createRepeated() => $pb.PbList<HeartbeatResponse>();
  @$core.pragma('dart2js:noInline')
  static HeartbeatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartbeatResponse>(create);
  static HeartbeatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get serverTime => $_getI64(1);
  @$pb.TagNumber(2)
  set serverTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<User> get activeUsers => $_getList(2);
}

/// 频道加入通知
class ChannelJoinNotification extends $pb.GeneratedMessage {
  factory ChannelJoinNotification({
    User? user,
    Node? node,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (node != null) {
      $result.node = node;
    }
    return $result;
  }
  ChannelJoinNotification._() : super();
  factory ChannelJoinNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelJoinNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChannelJoinNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOM<Node>(2, _omitFieldNames ? '' : 'node', subBuilder: Node.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelJoinNotification clone() => ChannelJoinNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelJoinNotification copyWith(void Function(ChannelJoinNotification) updates) => super.copyWith((message) => updates(message as ChannelJoinNotification)) as ChannelJoinNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelJoinNotification create() => ChannelJoinNotification._();
  ChannelJoinNotification createEmptyInstance() => create();
  static $pb.PbList<ChannelJoinNotification> createRepeated() => $pb.PbList<ChannelJoinNotification>();
  @$core.pragma('dart2js:noInline')
  static ChannelJoinNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelJoinNotification>(create);
  static ChannelJoinNotification? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  Node get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(Node v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  Node ensureNode() => $_ensure(1);
}

/// 频道离开通知
class ChannelLeaveNotification extends $pb.GeneratedMessage {
  factory ChannelLeaveNotification({
    $core.String? userId,
    $core.String? nodeId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    return $result;
  }
  ChannelLeaveNotification._() : super();
  factory ChannelLeaveNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChannelLeaveNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChannelLeaveNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nodeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChannelLeaveNotification clone() => ChannelLeaveNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChannelLeaveNotification copyWith(void Function(ChannelLeaveNotification) updates) => super.copyWith((message) => updates(message as ChannelLeaveNotification)) as ChannelLeaveNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelLeaveNotification create() => ChannelLeaveNotification._();
  ChannelLeaveNotification createEmptyInstance() => create();
  static $pb.PbList<ChannelLeaveNotification> createRepeated() => $pb.PbList<ChannelLeaveNotification>();
  @$core.pragma('dart2js:noInline')
  static ChannelLeaveNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChannelLeaveNotification>(create);
  static ChannelLeaveNotification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nodeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nodeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNodeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeId() => $_clearField(2);
}

enum StreamMessage_MessageType {
  chatMessage, 
  userStatus, 
  join, 
  leave, 
  heartbeat, 
  heartbeatAck, 
  notSet
}

/// 双向流消息容器
class StreamMessage extends $pb.GeneratedMessage {
  factory StreamMessage({
    Message? chatMessage,
    User? userStatus,
    ChannelJoinNotification? join,
    ChannelLeaveNotification? leave,
    HeartbeatRequest? heartbeat,
    HeartbeatResponse? heartbeatAck,
    $fixnum.Int64? timestamp,
    $core.String? nodeId,
  }) {
    final $result = create();
    if (chatMessage != null) {
      $result.chatMessage = chatMessage;
    }
    if (userStatus != null) {
      $result.userStatus = userStatus;
    }
    if (join != null) {
      $result.join = join;
    }
    if (leave != null) {
      $result.leave = leave;
    }
    if (heartbeat != null) {
      $result.heartbeat = heartbeat;
    }
    if (heartbeatAck != null) {
      $result.heartbeatAck = heartbeatAck;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    return $result;
  }
  StreamMessage._() : super();
  factory StreamMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StreamMessage_MessageType> _StreamMessage_MessageTypeByTag = {
    1 : StreamMessage_MessageType.chatMessage,
    2 : StreamMessage_MessageType.userStatus,
    3 : StreamMessage_MessageType.join,
    4 : StreamMessage_MessageType.leave,
    5 : StreamMessage_MessageType.heartbeat,
    6 : StreamMessage_MessageType.heartbeatAck,
    0 : StreamMessage_MessageType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<Message>(1, _omitFieldNames ? '' : 'chatMessage', subBuilder: Message.create)
    ..aOM<User>(2, _omitFieldNames ? '' : 'userStatus', subBuilder: User.create)
    ..aOM<ChannelJoinNotification>(3, _omitFieldNames ? '' : 'join', subBuilder: ChannelJoinNotification.create)
    ..aOM<ChannelLeaveNotification>(4, _omitFieldNames ? '' : 'leave', subBuilder: ChannelLeaveNotification.create)
    ..aOM<HeartbeatRequest>(5, _omitFieldNames ? '' : 'heartbeat', subBuilder: HeartbeatRequest.create)
    ..aOM<HeartbeatResponse>(6, _omitFieldNames ? '' : 'heartbeatAck', subBuilder: HeartbeatResponse.create)
    ..aInt64(7, _omitFieldNames ? '' : 'timestamp')
    ..aOS(8, _omitFieldNames ? '' : 'nodeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamMessage clone() => StreamMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamMessage copyWith(void Function(StreamMessage) updates) => super.copyWith((message) => updates(message as StreamMessage)) as StreamMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamMessage create() => StreamMessage._();
  StreamMessage createEmptyInstance() => create();
  static $pb.PbList<StreamMessage> createRepeated() => $pb.PbList<StreamMessage>();
  @$core.pragma('dart2js:noInline')
  static StreamMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamMessage>(create);
  static StreamMessage? _defaultInstance;

  StreamMessage_MessageType whichMessageType() => _StreamMessage_MessageTypeByTag[$_whichOneof(0)]!;
  void clearMessageType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Message get chatMessage => $_getN(0);
  @$pb.TagNumber(1)
  set chatMessage(Message v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  Message ensureChatMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  User get userStatus => $_getN(1);
  @$pb.TagNumber(2)
  set userStatus(User v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserStatus() => $_clearField(2);
  @$pb.TagNumber(2)
  User ensureUserStatus() => $_ensure(1);

  @$pb.TagNumber(3)
  ChannelJoinNotification get join => $_getN(2);
  @$pb.TagNumber(3)
  set join(ChannelJoinNotification v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasJoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearJoin() => $_clearField(3);
  @$pb.TagNumber(3)
  ChannelJoinNotification ensureJoin() => $_ensure(2);

  @$pb.TagNumber(4)
  ChannelLeaveNotification get leave => $_getN(3);
  @$pb.TagNumber(4)
  set leave(ChannelLeaveNotification v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLeave() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeave() => $_clearField(4);
  @$pb.TagNumber(4)
  ChannelLeaveNotification ensureLeave() => $_ensure(3);

  @$pb.TagNumber(5)
  HeartbeatRequest get heartbeat => $_getN(4);
  @$pb.TagNumber(5)
  set heartbeat(HeartbeatRequest v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeartbeat() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeartbeat() => $_clearField(5);
  @$pb.TagNumber(5)
  HeartbeatRequest ensureHeartbeat() => $_ensure(4);

  @$pb.TagNumber(6)
  HeartbeatResponse get heartbeatAck => $_getN(5);
  @$pb.TagNumber(6)
  set heartbeatAck(HeartbeatResponse v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeartbeatAck() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeartbeatAck() => $_clearField(6);
  @$pb.TagNumber(6)
  HeartbeatResponse ensureHeartbeatAck() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get timestamp => $_getI64(6);
  @$pb.TagNumber(7)
  set timestamp($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestamp() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get nodeId => $_getSZ(7);
  @$pb.TagNumber(8)
  set nodeId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNodeId() => $_has(7);
  @$pb.TagNumber(8)
  void clearNodeId() => $_clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
