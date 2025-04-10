import 'package:astro_game/k/AppState.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  // 其他变量保持不变
  final List<ChatMessage> _messages = [];
  final List<Player> _players = [
    Player(name: "玩家1", avatar: "assets/avatar1.png", virtualIP: "192.168.1.1"),
    Player(name: "玩家2", avatar: "assets/avatar2.png", virtualIP: "192.168.1.2"),
    Player(name: "玩家2", avatar: "assets/avatar2.png", virtualIP: "192.168.1.2"),
    Player(name: "玩家2", avatar: "assets/avatar2.png", virtualIP: "192.168.1.2"),
    Player(name: "玩家2", avatar: "assets/avatar2.png", virtualIP: "192.168.1.2"),
    Player(name: "玩家2", avatar: "assets/avatar2.png", virtualIP: "192.168.1.2"),
  ];

  @override
  void initState() {
    super.initState();
    // 添加一些测试消息
    _addTestMessages();
  }

  void _addTestMessages() {
    _messages.addAll([
      ChatMessage(
        senderName: "玩家1",
        senderAvatar: "assets/avatar1.png",
        content: "大家好，我是玩家1",
        time: "09:30",
        type: MessageType.text,
        isMe: false,
      ),
      ChatMessage(
        senderName: "我",
        senderAvatar: "assets/my_avatar.png",
        content: "你好，很高兴认识你！",
        time: "09:31",
        type: MessageType.text,
        isMe: true,
      ),
    ]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Widget _buildMessageContent(ChatMessage message) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        );
      case MessageType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            File(message.content),
            width: 200,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '图片加载失败',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('我的世界测试房间'),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            tooltip: '查看成员',
          ),
        ],
      ),
      endDrawer: _buildPlayerList(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          image: DecorationImage(
            image: const AssetImage("assets/chat_bg.png"),
            fit: BoxFit.cover,
            opacity: 0.1,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child:
                  _messages.isEmpty
                      ? _buildEmptyChat()
                      : ListView.builder(
                        controller: _scrollController,
                        itemCount: _messages.length,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        itemBuilder:
                            (context, index) =>
                                _buildMessageItem(_messages[index]),
                      ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyChat() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 80),
          const SizedBox(height: 16),
          Text(
            '暂无消息，开始聊天吧！',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList() {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  children: [
                    Icon(
                      Icons.group,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '房间成员 (${_players.length})',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _players.length,
                  itemBuilder: (context, index) {
                    final player = _players[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundImage: _tryLoadImage(player.avatar),
                          child: _getAvatarFallback(player),
                        ),
                        title: Text(
                          player.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        subtitle: Text(
                          player.virtualIP,
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        trailing: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 尝试加载图片
  ImageProvider? _tryLoadImage(String path) {
    try {
      if (path.startsWith('assets/')) {
        return AssetImage(path);
      } else if (path.startsWith('/')) {
        return FileImage(File(path));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // 头像加载失败时显示名字首字母
  Widget? _getAvatarFallback(Player player) {
    return player.name.isNotEmpty
        ? Text(
          player.name.characters.first,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
          ),
        )
        : null;
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.zero, // 移除左右边距
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildInputButton(Icons.image, '图片', _pickImage),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: _messageController,
                maxLines: 4,
                minLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: '输入消息...',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Material(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                onTap: _sendTextMessage,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputButton(
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
  ) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: _pickImage,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 24,
          ),
        ),
      ),
    );
  }

  // 添加一个通用的滚动到底部方法，避免重复代码
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // 添加一个通用的添加消息方法
  void _addMessage({
    required String content,
    required MessageType type,
    int? duration,
  }) {
    setState(() {
      _messages.add(
        ChatMessage(
          senderName: "我",
          senderAvatar: "assets/my_avatar.png",
          content: content,
          time: _getCurrentTime(),
          type: type,
          duration: duration,
          isMe: true,
        ),
      );
    });
    _scrollToBottom();
  }

  // 实现发送文本消息
  void _sendTextMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      _addMessage(content: text, type: MessageType.text);
      _messageController.clear();
    }
  }

  // 实现发送图片
  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _addMessage(content: image.path, type: MessageType.image);
    }
  }

  // 获取当前时间
  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isMe) ...[
            _buildAvatar(message),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  message.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: message.isMe ? 50 : 0,
                    right: message.isMe ? 0 : 50,
                    bottom: 4,
                  ),
                  child: Text(message.isMe ? "我" : message.senderName),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  padding:
                      message.type == MessageType.text
                          ? const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          )
                          : const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color:
                        message.isMe
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(18).copyWith(
                      bottomRight:
                          message.isMe
                              ? const Radius.circular(0)
                              : const Radius.circular(18),
                      bottomLeft:
                          message.isMe
                              ? const Radius.circular(18)
                              : const Radius.circular(0),
                    ),
                  ),
                  child: _buildMessageContent(message),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    message.time,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (message.isMe) ...[
            const SizedBox(width: 8),
            _buildAvatar(message),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundImage: _tryLoadImage(message.senderAvatar),
        child:
            message.senderName.isNotEmpty
                ? Text(
                  message.senderName.characters.first,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                )
                : null,
      ),
    );
  }
}

class ChatMessage {
  final String senderName;
  final String senderAvatar;
  final String content;
  final String time;
  final MessageType type;
  final int? duration; // 语音消息持续时间
  final bool isMe; // 是否是自己发送的消息

  ChatMessage({
    required this.senderName,
    required this.senderAvatar,
    required this.content,
    required this.time,
    required this.type,
    this.duration,
    required this.isMe,
  });
}

class Player {
  final String name;
  final String avatar;
  final String virtualIP;

  Player({required this.name, required this.avatar, required this.virtualIP});
}

enum MessageType { text, image }
