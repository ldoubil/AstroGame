import 'package:flutter/material.dart';
import '../generated/chat.pb.dart';
import '../services/chat_client.dart';
import '../services/chat_server.dart';

class ChatScreen extends StatefulWidget {
  final bool isHost;
  final String serverAddress;
  final int serverPort;
  final String playerName;

  const ChatScreen({
    Key? key,
    required this.isHost,
    required this.serverAddress,
    required this.serverPort,
    required this.playerName,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatClient _client;
  final List<ChatMessage> _messages = [];
  final List<Player> _players = [];
  final TextEditingController _messageController = TextEditingController();
  bool _isConnected = false;
  String? _hostName;

  @override
  void initState() {
    super.initState();
    _setupChat();
  }

  Future<void> _setupChat() async {
    // 如果是主机，启动服务器
    if (widget.isHost) {
      await startChatServer(widget.serverPort);
    }

    // 创建客户端
    _client = ChatClient(
      host: widget.serverAddress,
      port: widget.serverPort,
      playerName: widget.playerName,
      onMessageReceived: _handleMessageReceived,
      onPlayerChanged: _handlePlayerChanged,
      onHostChanged: _handleHostChanged,
    );

    // 连接到服务器
    final connected = await _client.connect();
    if (connected) {
      setState(() {
        _isConnected = true;
      });

      // 获取现有消息和玩家
      final messages = await _client.getMessages();
      final players = await _client.getPlayers();

      setState(() {
        _messages.addAll(messages);
        _players.clear();
        _players.addAll(players);

        // 找出主机
        for (final player in _players) {
          if (player.isHost) {
            _hostName = player.name;
            break;
          }
        }
      });
    }
  }

  void _handleMessageReceived(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _handlePlayerChanged(Player player) {
    setState(() {
      // 更新或添加玩家
      final index = _players.indexWhere((p) => p.playerId == player.playerId);
      if (index >= 0) {
        if (player.isConnected) {
          _players[index] = player;
        } else {
          _players.removeAt(index);
        }
      } else if (player.isConnected) {
        _players.add(player);
      }
    });
  }

  void _handleHostChanged(HostChangeNotification notification) {
    setState(() {
      _hostName = notification.newHostName;

      // 更新玩家列表中的主机状态
      for (var i = 0; i < _players.length; i++) {
        final player = _players[i];
        if (player.playerId == notification.newHostId) {
          _players[i] = player..isHost = true;
        } else {
          _players[i] = player..isHost = false;
        }
      }
    });
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isNotEmpty) {
      _client.sendMessage(content);
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _client.disconnect();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天室 ${widget.isHost ? "(主机)" : ""}'),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              _showPlayersDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.content),
                  subtitle: Text(
                    '${message.senderName} - ${_formatTimestamp(message.timestamp.toInt())}',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: '输入消息...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _isConnected ? _sendMessage : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPlayersDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('在线玩家'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _players.length,
              itemBuilder: (context, index) {
                final player = _players[index];
                return ListTile(
                  title: Text(player.name),
                  trailing:
                      player.isHost
                          ? Icon(Icons.star, color: Colors.amber)
                          : null,
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
