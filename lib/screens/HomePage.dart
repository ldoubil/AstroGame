import 'dart:math';

import 'package:astro_game/k/AppState.dart';
import 'package:astro_game/k/Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _roomCodeController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();

  void _showJoinRoomDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('加入房间'),
            content: TextField(
              controller: _roomCodeController,
              decoration: const InputDecoration(
                labelText: '房间码',
                hintText: '请输入房间码',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: 处理加入房间逻辑
                  Navigator.pop(context);
                },
                child: const Text('加入'),
              ),
            ],
          ),
    );
  }

  // 新增创建房间对话框方法
  void _showCreateRoomDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('创建房间'),
            content: TextField(
              controller: _roomNameController,
              decoration: const InputDecoration(
                labelText: '房间名称',
                hintText: '请输入房间名称',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _roomNameController.clear();
                  Navigator.pop(context);
                },
                child: const Text('取消'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_roomNameController.text.isNotEmpty) {
                    // 生成32位随机字符串
                    final random = Random();
                    const chars =
                        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
                    final password =
                        List.generate(
                          32,
                          (index) => chars[random.nextInt(chars.length)],
                        ).join();
                    final serverName =
                        List.generate(
                          32,
                          (index) => chars[random.nextInt(chars.length)],
                        ).join();
                    // 修改为使用AppState的addChannel方法
                    AppState().addChannel(
                      Channel(
                        channelName: _roomNameController.text,
                        serverName: serverName, // 默认服务器名称
                        serverPassword: password, // 空密码
                        rawString: '', // 生成原始字符串格式
                      ),
                    );
                    _roomNameController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('确定'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Watch((context) {
            final channels = AppState().kchannelList.value;
            return channels.isEmpty
                ? Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 使用静态图标替代 Lottie 动画
                      Icon(
                        Icons.rocket_launch,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '探索太空的旅程即将开始',
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '创建或加入一个频道，与其他探险家一起联机吧！',
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const SizedBox(height: 24),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final isHorizontal =
                                    constraints.maxWidth >= 300;
                                return Flex(
                                  direction:
                                      isHorizontal
                                          ? Axis.horizontal
                                          : Axis.vertical,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildActionButton(
                                      context,
                                      Icons.add_circle_outline,
                                      '创建房间',
                                      _showCreateRoomDialog, // 改为调用新方法
                                    ),
                                    SizedBox(
                                      width: isHorizontal ? 16 : 0,
                                      height: isHorizontal ? 0 : 16,
                                    ),
                                    _buildActionButton(
                                      context,
                                      Icons.login_outlined,
                                      '加入房间',
                                      _showJoinRoomDialog,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    final channel = channels[index];
                    return Dismissible(
                      key: ValueKey(channel.id), // 使用 ValueKey 替代普通的 Key
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        try {
                          AppState().removeChannel(channel.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('已删除频道：${channel.channelName}'),
                              action: SnackBarAction(
                                label: '撤销',
                                onPressed: () {
                                  AppState().addChannel(channel);
                                },
                              ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('删除频道失败')),
                          );
                        }
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(channels[index].channelName),
                          subtitle: Text(channels[index].channelName),
                          leading: const Icon(Icons.forum),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            // TODO: 处理频道点击事件
                          },
                        ),
                      ),
                    );
                  },
                );
          }),
        ],
      ),
      floatingActionButton: Watch((context) {
        final channels = AppState().kchannelList.value;
        return channels.isEmpty
            ? Container() // 替换 null 为空容器
            : SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  spacing: 12,
                  spaceBetweenChildren: 12,
                  children: [
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: '创建房间',
                      onTap: _showCreateRoomDialog,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.login),
                      label: '加入房间',
                      onTap: _showJoinRoomDialog,
                    ),
                  ],
                )
                as Widget; // 显式转换为 Widget 类型
      }),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _roomCodeController.dispose();
    _roomNameController.dispose(); // 新增控制器销毁
    super.dispose();
  }
}
