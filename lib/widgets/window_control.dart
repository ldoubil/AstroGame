import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowControls extends StatefulWidget {
  const WindowControls({super.key});

  @override
  State<WindowControls> createState() => _WindowControlsState();
}

class _WindowControlsState extends State<WindowControls> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    final isMaximized = await windowManager.isMaximized();
    if (mounted) {
      setState(() {
        _isMaximized = isMaximized;
      });
    }
  }

  @override
  void onWindowMaximize() {
    if (mounted) {
      setState(() {
        _isMaximized = true;
      });
    }
  }

  @override
  void onWindowUnmaximize() {
    if (mounted) {
      setState(() {
        _isMaximized = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 添加调试信息

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => windowManager.minimize(),
          tooltip: '最小化',
        ),
        IconButton(
          icon: Icon(_isMaximized ? Icons.filter_none : Icons.crop_square),
          onPressed: () async {
            if (_isMaximized) {
              await windowManager.unmaximize();
            } else {
              await windowManager.maximize();
            }
            // 手动更新状态，以防事件监听不工作
            if (mounted) {
              final isMaximized = await windowManager.isMaximized();
              setState(() {
                _isMaximized = isMaximized;
              });
            }
          },
          tooltip: '最大化/还原',
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            // 替换托盘提示为系统通知
            windowManager.close();
          },
          tooltip: '关闭',
        ),
      ],
    );
  }
}
