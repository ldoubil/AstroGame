import 'package:flutter/material.dart';
import 'dart:io';
import 'package:window_manager/window_manager.dart';

class WindowControls extends StatelessWidget {
  const WindowControls({super.key});

  @override
  Widget build(BuildContext context) {
    // 如果不是桌面平台，返回空容器
    if (!Platform.isWindows && !Platform.isMacOS && !Platform.isLinux) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () async {
            await windowManager.minimize();
          },
          tooltip: '最小化',
        ),
        IconButton(
          icon: const Icon(Icons.crop_square),
          onPressed: () async {
            if (await windowManager.isMaximized()) {
              await windowManager.unmaximize();
            } else {
              await windowManager.maximize();
            }
          },
          tooltip: '最大化',
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            await windowManager.close();
          },
          tooltip: '关闭',
        ),
      ],
    );
  }
}
