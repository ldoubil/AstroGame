import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _portController = TextEditingController(text: '50051');
  bool _isHost = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _joinChat() {
    final name = _nameController.text.trim();
    final address = _addressController.text.trim();
    final portText = _portController.text.trim();
    
    if (name.isEmpty) {
      _showError('请输入您的名字');
      return;
    }
    
    if (!_isHost && address.isEmpty) {
      _showError('请输入服务器地址');
      return;
    }
    
    int? port = int.tryParse(portText);
    if (port == null || port <= 0 || port > 65535) {
      _showError('请输入有效的端口号 (1-65535)');
      return;
    }
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          isHost: _isHost,
          serverAddress: _isHost ? 'localhost' : address,
          serverPort: port,
          playerName: name,
        ),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('局域网聊天'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '您的名字',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              title: Text('作为主机'),
              value: _isHost,
              onChanged: (value) {
                setState(() {
                  _isHost = value;
                });
              },
            ),
            SizedBox(height: 16),
            if (!_isHost)
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: '服务器地址',
                  border: OutlineInputBorder(),
                ),
              ),
            if (!_isHost) SizedBox(height: 16),
            TextField(
              controller: _portController,
              decoration: InputDecoration(
                labelText: '端口',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _joinChat,
              child: Text(_isHost ? '创建聊天室' : '加入聊天室'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}