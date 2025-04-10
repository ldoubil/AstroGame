import 'package:astro_game/APP.dart';
import 'package:flutter/material.dart';
import 'package:astro_game/k/Box.dart';
import 'package:path/path.dart' as path;
import 'dart:io' show Directory, Platform;

import 'package:window_manager/window_manager.dart';

void main() async {
  // 确保 Flutter 绑定初始化
  WidgetsFlutterBinding.ensureInitialized();
  // 如果是桌面平台，初始化窗口管理器
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 720),
      minimumSize: Size(300, 300),
      center: true,
      title: 'Astro Game',
      titleBarStyle: TitleBarStyle.hidden, // 隐藏标题栏
      backgroundColor: Colors.transparent, // 背景透明
      skipTaskbar: false, // 在任务栏显示
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  // 获取应用程序可执行文件所在目录
  final executablePath = Platform.resolvedExecutable;
  final executableDir = path.dirname(executablePath);
  final dbDir = path.join(executableDir, 'data', 'objectbox-db');

  // 确保数据库目录存在
  await Directory(dbDir).create(recursive: true);

  // 初始化 ObjectBox
  await AppBox().initialize(dbDir);

  // 运行应用
  runApp(const MyApp());
}

// 在应用关闭时关闭 ObjectBox
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // 关闭 ObjectBox 存储
    AppBox().closeStore();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return App();
  }
}
