import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart'; // 添加导入

final _uuid = Uuid();

class ThemeSettings {
  int colorValue;
  int themeModeValue;

  ThemeSettings({required this.colorValue, required this.themeModeValue});

  ThemeSettings.defaults()
    : colorValue = Colors.cyanAccent.value,
      themeModeValue = 0;

  Color get color => Color(colorValue);

  set color(Color color) => colorValue = color.value;

  ThemeMode get themeMode => switch (themeModeValue) {
    1 => ThemeMode.dark,
    2 => ThemeMode.light,
    _ => ThemeMode.system,
  };

  set themeMode(ThemeMode mode) =>
      themeModeValue = switch (mode) {
        ThemeMode.dark => 1,
        ThemeMode.light => 2,
        ThemeMode.system => 0,
      };

  Map<String, dynamic> toMap() => {
    'colorValue': colorValue,
    'themeModeValue': themeModeValue,
  };

  static ThemeSettings fromMap(Map data) => ThemeSettings(
    colorValue: data['colorValue'],
    themeModeValue: data['themeModeValue'],
  );
}

class UserInfo {
  String name;
  String uuid;

  UserInfo({required this.name, String? uuid}) : uuid = uuid ?? _uuid.v4();

  UserInfo copyWith({String? name}) {
    return UserInfo(name: name ?? this.name, uuid: uuid);
  }

  Map<String, dynamic> toMap() => {'name': name, 'uuid': uuid};

  static UserInfo fromMap(Map data) =>
      UserInfo(name: data['name'], uuid: data['uuid']);
}

// 在 Channel 类中添加 id 字段
class Channel {
  final String id; // 新增
  String channelName;
  String serverName;
  String serverPassword;
  String rawString;

  Channel({
    String? id, // 新增
    required this.channelName,
    required this.serverName,
    required this.serverPassword,
    required this.rawString,
  }) : id = id ?? _uuid.v4(); // 新增

  Map<String, dynamic> toMap() => {
    'id': id, // 新增
    'channelName': channelName,
    'serverName': serverName,
    'serverPassword': serverPassword,
    'rawString': rawString,
  };

  static Channel fromMap(Map data) => Channel(
    id: data['id'], // 新增
    channelName: data['channelName'],
    serverName: data['serverName'],
    serverPassword: data['serverPassword'],
    rawString: data['rawString'],
  );
}

// 在 AppBox 类中添加和修改相关方法
class AppBox {
  static final AppBox _instance = AppBox._internal();
  factory AppBox() => _instance;
  AppBox._internal();

  late Box themeBox;
  late Box userBox;
  late Box channelBox;

  static const themeKey = 'theme';
  static const userKey = 'user';

  static const channelKey = 'channels'; // 添加常量key

  Future<void> initialize(String customDirectory) async {
    Hive.init(customDirectory);
    themeBox = await Hive.openBox('themeBox');
    userBox = await Hive.openBox('userBox');
    channelBox = await Hive.openBox('channelBox');
  }

  void saveChannel(Channel channel) {
    final channels = getAllChannels();
    channels.add(channel);
    channelBox.put(channelKey, channels.map((e) => e.toMap()).toList());
  }

  void removeChannelById(String id) {
    final channels = getAllChannels();
    channels.removeWhere((e) => e.id == id);
    // 保存更新后的频道列表到数据库
    channelBox.put(channelKey, channels.map((e) => e.toMap()).toList());
  }

  Channel? getChannelById(String id) {
    try {
      return getAllChannels().firstWhere((channel) => channel.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Channel> getAllChannels() {
    final data = channelBox.get(channelKey);
    if (data == null) return [];
    return (data as List).map((e) => Channel.fromMap(e)).toList();
  }

  void removeChannel(Channel channel) {
    final channels = getAllChannels();
    channels.removeWhere(
      (e) =>
          e.channelName == channel.channelName &&
          e.serverName == channel.serverName,
    );
    channelBox.put(channelKey, channels.map((e) => e.toMap()).toList());
  }

  ThemeSettings getThemeSettings({
    Color defaultColor = Colors.cyanAccent,
    ThemeMode defaultThemeMode = ThemeMode.system,
  }) {
    final data = themeBox.get(themeKey);
    if (data != null) return ThemeSettings.fromMap(data);
    final newSettings = ThemeSettings(
      colorValue: defaultColor.value,
      themeModeValue: switch (defaultThemeMode) {
        ThemeMode.dark => 1,
        ThemeMode.light => 2,
        _ => 0,
      },
    );
    saveThemeSettings(newSettings);
    return newSettings;
  }

  int saveColorSettings(Color color) {
    final settings = getThemeSettings();
    settings.color = color;
    saveThemeSettings(settings);
    return 1;
  }

  String getUUID() {
    final user = userBox.get(userKey);
    if (user != null) return user['uuid'];
    final newUser = UserInfo(name: "无名氏");
    saveUserInfo(newUser);
    return newUser.uuid;
  }

  String getName() {
    final user = userBox.get(userKey);
    if (user != null) return user['name'];
    final newUser = UserInfo(name: "无名氏");
    saveUserInfo(newUser);
    return newUser.name;
  }

  int saveName(String name) {
    final user = getUserInfo();
    user.name = name;
    return saveUserInfo(user);
  }

  int saveThemeModeSettings(ThemeMode themeMode) {
    final settings = getThemeSettings();
    settings.themeMode = themeMode;
    saveThemeSettings(settings);
    return 1;
  }

  int saveThemeSettings(ThemeSettings settings) {
    themeBox.put(themeKey, settings.toMap());
    return 1;
  }

  int saveUserInfo(UserInfo userInfo) {
    userBox.put(userKey, userInfo.toMap());
    return 1;
  }

  UserInfo getUserInfo({String defaultName = "用户"}) {
    final data = userBox.get(userKey);
    if (data != null) return UserInfo.fromMap(data);
    return UserInfo(name: defaultName);
  }

  void closeStore() {
    Hive.close();
  }
}
