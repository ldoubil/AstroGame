import 'package:flutter/material.dart';
// 这个文件会由 ObjectBox 自动生成
import '../objectbox.g.dart';

@Entity()
class ThemeSettings {
  @Id()
  int id;

  // 存储主题颜色的RGB值（作为整数）
  int colorValue;

  // 存储主题模式 (0: 跟随系统, 1: 暗色, 2: 亮色)
  int themeModeValue;

  // 使用命名构造函数创建默认实例
  ThemeSettings.defaults()
    : id = 1,
      colorValue = Colors.cyanAccent.toARGB32(),
      themeModeValue = 0;

  ThemeSettings({
    this.id = 1, // 固定使用ID 1
    required this.colorValue,
    required this.themeModeValue,
  });

  // 获取Color对象
  Color get color => Color(colorValue);

  // 设置Color对象
  set color(Color color) => colorValue = color.toARGB32();

  // 获取ThemeMode对象
  ThemeMode get themeMode => switch (themeModeValue) {
    1 => ThemeMode.dark,
    2 => ThemeMode.light,
    _ => ThemeMode.system,
  };

  // 设置ThemeMode对象
  set themeMode(ThemeMode mode) =>
      themeModeValue = switch (mode) {
        ThemeMode.dark => 1,
        ThemeMode.light => 2,
        ThemeMode.system => 0,
      };

  // 复制并修改当前实例
  ThemeSettings copyWith({int? colorValue, int? themeModeValue}) {
    return ThemeSettings(
      colorValue: colorValue ?? this.colorValue,
      themeModeValue: themeModeValue ?? this.themeModeValue,
    );
  }
}

@Entity()
class UserInfo {
  @Id()
  int id;

  // 用户名称
  String name;

  UserInfo({this.id = 1, required this.name}); // 固定使用ID 1
}

class AppBox {
  late final Store _store;
  late final Box<ThemeSettings> _themeBox;
  late final Box<UserInfo> _userBox;

  // 默认存储目录
  static String defaultDirectory = 'app-data-db';

  // 单例模式
  static final AppBox _instance = AppBox._internal();

  factory AppBox() {
    return _instance;
  }

  AppBox._internal();

  // 初始化存储
  Future<void> initialize({String? customDirectory}) async {
    final directory = customDirectory ?? defaultDirectory;
    _store = await openStore(directory: directory);
    _themeBox = _store.box<ThemeSettings>();
    _userBox = _store.box<UserInfo>();
  }

  // 获取主题设置，如果不存在则返回默认值
  ThemeSettings getThemeSettings({
    Color defaultColor = Colors.cyanAccent, // 默认蓝色
    ThemeMode defaultThemeMode = ThemeMode.system, // 默认跟随系统
  }) {
    final settings = _themeBox.get(1);
    if (settings != null) {
      return settings;
    }

    // 创建新的设置并保存
    final newSettings = ThemeSettings(
      colorValue: defaultColor.value,
      themeModeValue:
          defaultThemeMode == ThemeMode.dark
              ? 1
              : defaultThemeMode == ThemeMode.light
              ? 2
              : 0,
    );
    saveThemeSettings(newSettings);
    return newSettings;
  }

  // 保存颜色设置
  int saveColorSettings(Color color) {
    final settings = _themeBox.get(1);
    if (settings != null) {
      settings.colorValue = color.value;
      return _themeBox.put(settings);
    } else {
      return 0;
    }
  }

  // 保存主题模式设置
  int saveThemeModeSettings(ThemeMode themeMode) {
    final settings = _themeBox.get(1);
    if (settings != null) {
      settings.themeModeValue =
          themeMode == ThemeMode.dark
              ? 1
              : themeMode == ThemeMode.light
              ? 2
              : 0;
      return _themeBox.put(settings);
    }
    return 0; // 如果设置不存在则返回0
  }

  // 保存主题设置
  int saveThemeSettings(ThemeSettings settings) {
    // 先检查是否存在ID为1的对象
    final existingSettings = _themeBox.get(1);
    if (existingSettings != null) {
      // 如果存在，更新其属性而不是创建新对象
      existingSettings.colorValue = settings.colorValue;
      existingSettings.themeModeValue = settings.themeModeValue;
      return _themeBox.put(existingSettings);
    } else {
      // 如果不存在，创建新对象
      settings.id = 0; // 使用0让ObjectBox自动分配ID
      final newId = _themeBox.put(settings);
      // 如果自动分配的ID不是1，则删除并重新创建
      if (newId != 1) {
        _themeBox.remove(newId);
        settings.id = 1;
        try {
          return _themeBox.put(settings);
        } catch (e) {
          // 如果仍然失败，则清空所有记录并重新插入
          _themeBox.removeAll();
          settings.id = 1;
          return _themeBox.put(settings);
        }
      }
      return newId;
    }
  }

  // 保存用户信息
  int saveUserInfo(UserInfo userInfo) {
    // 先检查是否存在ID为1的对象
    final existingUserInfo = _userBox.get(1);
    if (existingUserInfo != null) {
      // 如果存在，更新其属性而不是创建新对象
      existingUserInfo.name = userInfo.name;
      return _userBox.put(existingUserInfo);
    } else {
      // 如果不存在，创建新对象
      userInfo.id = 0; // 使用0让ObjectBox自动分配ID
      final newId = _userBox.put(userInfo);
      // 如果自动分配的ID不是1，则删除并重新创建
      if (newId != 1) {
        _userBox.remove(newId);
        userInfo.id = 1;
        try {
          return _userBox.put(userInfo);
        } catch (e) {
          // 如果仍然失败，则清空所有记录并重新插入
          _userBox.removeAll();
          userInfo.id = 1;
          return _userBox.put(userInfo);
        }
      }
      return newId;
    }
  }

  // 获取用户信息，如果不存在则返回默认值
  UserInfo getUserInfo({String defaultName = "用户"}) {
    final userInfo = _userBox.get(1);
    if (userInfo != null) {
      return userInfo;
    }

    return UserInfo(name: defaultName);
  }

  // 关闭存储
  void closeStore() {
    _store.close();
  }
}
