import 'dart:async';
import 'package:fixnum/fixnum.dart'; // Correct import for Int64
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';
import '../generated/chat.pb.dart';
import '../generated/chat.pbgrpc.dart';

class ChatServiceImpl extends ChatServiceBase {
  final Map<String, Player> _players = {};
  final List<ChatMessage> _messages = [];
  final Map<String, StreamController<ChatMessage>> _messageControllers = {};
  final Map<String, StreamController<Player>> _playerControllers = {};
  final Map<String, StreamController<HostChangeNotification>> _hostControllers =
      {};
  final Uuid _uuid = Uuid();

  // 发送消息
  @override
  Future<SendMessageResponse> sendMessage(
    ServiceCall call,
    SendMessageRequest request,
  ) async {
    final metadata = call.clientMetadata ?? {};
    final playerId = metadata['player_id'] ?? '';

    if (!_players.containsKey(playerId)) {
      return SendMessageResponse()
        ..success = false
        ..errorMessage = '未找到发送者';
    }

    final sender = _players[playerId]!;
    final message =
        ChatMessage()
          ..messageId = _uuid.v4()
          ..content = request.content
          ..timestamp = Int64(
            DateTime.now().millisecondsSinceEpoch,
          ) // Correct Int64 usage
          ..senderId = playerId
          ..senderName = sender.name;

    _messages.add(message);

    // 广播消息给所有订阅者
    if (request.targetPlayerId.isEmpty) {
      _messageControllers.forEach((_, controller) {
        controller.add(message);
      });
    } else if (_messageControllers.containsKey(request.targetPlayerId)) {
      _messageControllers[request.targetPlayerId]!.add(message);
    }

    return SendMessageResponse()
      ..success = true
      ..message = message;
  }

  // 获取消息
  @override
  Future<GetMessagesResponse> getMessages(
    ServiceCall call,
    GetMessagesRequest request,
  ) async {
    return GetMessagesResponse()..messages.addAll(_messages);
  }

  // 订阅消息流
  @override
  Stream<ChatMessage> subscribeToMessages(
    ServiceCall call,
    GetMessagesRequest request,
  ) {
    final metadata = call.clientMetadata ?? {};
    final playerId = metadata['player_id'] ?? '';

    if (!_players.containsKey(playerId)) {
      throw GrpcError.unauthenticated('未找到玩家');
    }

    // Use a broadcast controller so we can listen for done events
    final controller = StreamController<ChatMessage>.broadcast();
    _messageControllers[playerId] = controller;

    // Listen to the controller's done event to clean up
    controller.done.then((_) {
      _messageControllers.remove(playerId);
    });

    return controller.stream;
  }

  // 加入游戏
  @override
  Future<JoinGameResponse> joinGame(
    ServiceCall call,
    JoinGameRequest request,
  ) async {
    final player = request.player;

    // 如果是第一个加入的玩家，设为主机
    if (_players.isEmpty) {
      player.isHost = true;
    } else {
      player.isHost = false;
    }

    player.isConnected = true;
    _players[player.playerId] = player;

    // 通知所有玩家有新玩家加入
    _playerControllers.forEach((_, controller) {
      controller.add(player);
    });

    return JoinGameResponse()
      ..success = true
      ..players.addAll(_players.values);
  }

  // 离开游戏
  @override
  Future<LeaveGameResponse> leaveGame(
    ServiceCall call,
    LeaveGameRequest request,
  ) async {
    final playerId = request.playerId;

    if (!_players.containsKey(playerId)) {
      return LeaveGameResponse()..success = false;
    }

    final leavingPlayer = _players[playerId]!;
    _players.remove(playerId);

    // 如果离开的是主机，选择新主机
    if (leavingPlayer.isHost && _players.isNotEmpty) {
      final newHostId = _players.keys.first;
      final newHost = _players[newHostId]!..isHost = true;

      final notification =
          HostChangeNotification()
            ..newHostId = newHostId
            ..newHostName = newHost.name;

      // 通知所有玩家主机变更
      _hostControllers.forEach((_, controller) {
        controller.add(notification);
      });
    }

    // 通知所有玩家有玩家离开
    final offlinePlayer = leavingPlayer..isConnected = false;
    _playerControllers.forEach((_, controller) {
      controller.add(offlinePlayer);
    });

    return LeaveGameResponse()..success = true;
  }

  // 获取玩家列表
  @override
  Future<GetPlayersResponse> getPlayers(
    ServiceCall call,
    GetPlayersRequest request,
  ) async {
    return GetPlayersResponse()..players.addAll(_players.values);
  }

  // 订阅玩家变动
  @override
  Stream<Player> subscribeToPlayerChanges(
    ServiceCall call,
    GetPlayersRequest request,
  ) {
    final metadata = call.clientMetadata ?? {};
    final playerId = metadata['player_id'] ?? '';

    if (!_players.containsKey(playerId)) {
      throw GrpcError.unauthenticated('未找到玩家');
    }

    // Use a broadcast controller so we can listen for done events
    final controller = StreamController<Player>.broadcast();
    _playerControllers[playerId] = controller;

    // Listen to the controller's done event to clean up
    controller.done.then((_) {
      _playerControllers.remove(playerId);
    });

    return controller.stream;
  }

  // 订阅主机变更
  @override
  Stream<HostChangeNotification> subscribeToHostChanges(
    ServiceCall call,
    GetPlayersRequest request,
  ) {
    final metadata = call.clientMetadata ?? {};
    final playerId = metadata['player_id'] ?? '';

    if (!_players.containsKey(playerId)) {
      throw GrpcError.unauthenticated('未找到玩家');
    }

    // Use a broadcast controller so we can listen for done events
    final controller = StreamController<HostChangeNotification>.broadcast();
    _hostControllers[playerId] = controller;

    // Listen to the controller's done event to clean up
    controller.done.then((_) {
      _hostControllers.remove(playerId);
    });

    return controller.stream;
  }
}

// 启动服务器
Future<Server> startChatServer(int port) async {
  final server = Server([ChatServiceImpl()]);
  await server.serve(port: port);
  print('服务器启动在端口: $port');
  return server;
}
