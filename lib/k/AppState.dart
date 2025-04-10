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

  //getUUID
  final uuid = signal<String>(AppBox().getUUID()); // 用户唯一标  识
  //name
  final kname = signal<String>(AppBox().getName()); // 用户名称
  // 获取屏幕分割宽度 用于区分手机和桌面
  final screenSplitWidth = signal<double>(480); // 屏幕分割宽度

  //List<Channel>
  final kchannelList = signal<List<Channel>>(AppBox().getAllChannels()); // 频道列表

  //删除频道
  void removeChannel(String id) {
    AppBox().removeChannelById(id);
    kchannelList.value = AppBox().getAllChannels();
  }

  //添加频道
  void addChannel(Channel channel) {
    AppBox().saveChannel(channel);
    kchannelList.value = AppBox().getAllChannels();
  }

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

  //设置名字
  void setName(String name) {
    kname.value = name;
    AppBox().saveName(name);
  }
}

// 全局访问点
final appState = AppState();
