// 导入必要的Flutter包和自定义模块
import 'package:astro_game/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:astro_game/k/AppState.dart';
import 'package:signals_flutter/signals_flutter.dart';

// 定义应用程序的主要StatefulWidget
class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _MyAppState();
}

// 应用程序的状态管理类
class _MyAppState extends State<App> {
  // 主题相关的状态变量

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 返回应用程序的根Widget
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppState().themeColor.watch(context), // 设置当前主题颜色,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppState().themeColor.watch(context),
        brightness: Brightness.dark,
      ),
      themeMode: AppState().themeMode.watch(context), // 设置当前主题模式
      home: MainScreen(),
    );
  }
}
