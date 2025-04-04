import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';
import '../generated/chat.pb.dart';
import '../generated/chat.pbgrpc.dart';

class ChatClient {
  late ClientChannel _channel;
  late ChatServiceClient _stub;
  final String _playerId;
  final String _playerName;
  bool _isConnected = false;

  // 消息流订阅
  StreamSubscription? _messageSubscription;
  StreamSubscription? _playerSubscription;
  StreamSubscription? _hostSubscription;

  // 回调函数
  final void Function(ChatMessage)? onMessageReceived;
  final void Function(Player)? onPlayerChanged;
  final void Function(HostChangeNotification)? onHostChanged;

  ChatClient({
    required String host,
    required int port,
    required String playerName,
    this.onMessageReceived,
    this.onPlayerChanged,
    this.onHostChanged,
  }) : _playerId = Uuid().v4(),
       _playerName = playerName {
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _stub = ChatServiceClient(_channel);
  }

  // 连接到服务器
  Future<bool> connect() async {
    if (_isConnected) return true;

    try {
      final player =
          Player()
            ..playerId = _playerId
            ..name = _playerName
            ..isHost = false
            ..isConnected = true;

      final response = await _stub.joinGame(
        JoinGameRequest()..player = player,
        options: CallOptions(metadata: {'player_id': _playerId}),
      );

      if (response.success) {
        _isConnected = true;
        _subscribeToStreams();
        return true;
      }
      return false;
    } catch (e) {
      print('连接失败: $e');
      return false;
    }
  }

  // 断开连接
  Future<void> disconnect() async {
    if (!_isConnected) return;

    try {
      await _stub.leaveGame(
        LeaveGameRequest()..playerId = _playerId,
        options: CallOptions(metadata: {'player_id': _playerId}),
      );
    } catch (e) {
      print('断开连接错误: $e');
    } finally {
      _cancelSubscriptions();
      await _channel.shutdown();
      _isConnected = false;
    }
  }

  // 发送消息
  Future<bool> sendMessage(String content, {String targetPlayerId = ''}) async {
    if (!_isConnected) return false;

    try {
      final response = await _stub.sendMessage(
        SendMessageRequest()
          ..content = content
          ..targetPlayerId = targetPlayerId,
        options: CallOptions(metadata: {'player_id': _playerId}),
      );

      return response.success;
    } catch (e) {
      print('发送消息错误: $e');
      return false;
    }
  }

  // 获取所有消息
  Future<List<ChatMessage>> getMessages() async {
    if (!_isConnected) return [];

    try {
      final response = await _stub.getMessages(
        GetMessagesRequest(),
        options: CallOptions(metadata: {'player_id': _playerId}),
      );

      return response.messages;
    } catch (e) {
      print('获取消息错误: $e');
      return [];
    }
  }

  // 获取所有玩家
  Future<List<Player>> getPlayers() async {
    if (!_isConnected) return [];

    try {
      final response = await _stub.getPlayers(
        GetPlayersRequest(),
        options: CallOptions(metadata: {'player_id': _playerId}),
      );

      return response.players;
    } catch (e) {
      print('获取玩家错误: $e');
      return [];
    }
  }

  // 订阅流
  void _subscribeToStreams() {
    // 订阅消息流
    if (onMessageReceived != null) {
      _messageSubscription = _stub
          .subscribeToMessages(
            GetMessagesRequest(),
            options: CallOptions(metadata: {'player_id': _playerId}),
          )
          .listen(onMessageReceived);
    }

    // 订阅玩家变动
    if (onPlayerChanged != null) {
      _playerSubscription = _stub
          .subscribeToPlayerChanges(
            GetPlayersRequest(),
            options: CallOptions(metadata: {'player_id': _playerId}),
          )
          .listen(onPlayerChanged);
    }

    // 订阅主机变更
    if (onHostChanged != null) {
      _hostSubscription = _stub
          .subscribeToHostChanges(
            GetPlayersRequest(),
            options: CallOptions(metadata: {'player_id': _playerId}),
          )
          .listen(onHostChanged);
    }
  }

  // 取消订阅
  void _cancelSubscriptions() {
    _messageSubscription?.cancel();
    _playerSubscription?.cancel();
    _hostSubscription?.cancel();

    _messageSubscription = null;
    _playerSubscription = null;
    _hostSubscription = null;
  }
}
