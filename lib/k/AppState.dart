import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:astro_game/k/Box.dart';

/// 应用全局状态管理类
class AppState {
  // 单例模式
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  // 主题相关状态
  final themeColor = signal<Color>(AppBox().getThemeSettings().color); // 主题颜色
  //  创建一个状态 主题模式 分别是 跟随系统 暗色 亮色
  final themeMode = signal<ThemeMode>(
    AppBox().getThemeSettings().themeMode,
  ); // 主题模式

  //设置主题颜色
  void setThemeColor(Color color) {
    themeColor.value = color;
    // 将主题颜色保存到本地存储
    AppBox().saveColorSettings(color);
  }

  // 设置主题模式
  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    // 将主题模式保存到本地存储
    AppBox().saveThemeModeSettings(mode);
  }
}

// 全局访问点
final appState = AppState();
