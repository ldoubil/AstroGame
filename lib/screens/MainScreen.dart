import 'dart:io';
import 'package:flutter/material.dart';
import 'package:astro_game/screens/HomePage.dart';
import 'package:astro_game/screens/ProfilePage.dart';
import 'package:astro_game/widgets/theme_selector.dart'; // 添加主题选择器导入
import 'package:astro_game/widgets/window_control.dart'; // 添加窗口控制导入
import 'package:astro_game/k/AppState.dart';
import 'package:signals_flutter/signals_flutter.dart'; // 添加

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 页面列表，用于持久化内嵌
  final List<Widget> _pages = [const HomePage(), const ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 获取主题模式的文本描述
  String getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return '亮色模式';
      case ThemeMode.dark:
        return '暗色模式';
      case ThemeMode.system:
        return '跟随系统';
    }
  }

  @override
  Widget build(BuildContext context) {
    // 获取主题颜色
    final colorScheme = Theme.of(context).colorScheme;
    // 获取屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;
    // 判断是否为宽屏设备（宽度大于600像素视为宽屏）
    final isWideScreen = screenWidth > 600;

    // 判断是否为桌面平台（仅用于窗口控制按钮）
    final isDesktop =
        Platform.isWindows || Platform.isMacOS || Platform.isLinux;

    return Scaffold(
      // 修改背景色为次颜色
      // 主页面的基本结构
      appBar: AppBar(
        title: const Text('主页面'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        actions: [
          Watch((context) {
            // 直接监听 themeMode 信号
            final themeMode = AppState().themeMode.value;
            final appState = AppState();

            // 获取主题对应的图标
            IconData getThemeIcon() {
              switch (themeMode) {
                case ThemeMode.light:
                  return Icons.wb_sunny;
                case ThemeMode.dark:
                  return Icons.nightlight_round;
                default:
                  return Icons.auto_mode;
              }
            }

            // 切换主题模式的逻辑
            void toggleThemeMode() {
              switch (themeMode) {
                case ThemeMode.light:
                  appState.setThemeMode(ThemeMode.dark);
                  break;
                case ThemeMode.dark:
                  appState.setThemeMode(ThemeMode.system);
                  break;
                default:
                  appState.setThemeMode(ThemeMode.light);
              }
            }

            return IconButton(
              icon: Icon(getThemeIcon()),
              onPressed: toggleThemeMode,
              tooltip: getThemeModeText(themeMode),
              padding: const EdgeInsets.all(8),
            );
          }),

          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () => showThemeColorPicker(context),
            tooltip: '选择主题颜色',
            padding: const EdgeInsets.all(8),
          ),

          // 判断是否为桌面平台
          if (isDesktop) ...[
            // 添加窗口控制按钮
            const WindowControls(),
          ],
        ],
      ),
      body: Stack(
        children: [
          // 主内容区域
          IndexedStack(index: _selectedIndex, children: _pages),

          // 仅在宽屏设备显示悬浮导航
          if (isWideScreen)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuad,
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(51),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        // 选中项指示器
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutQuad,
                          left: _selectedIndex * 100,
                          top: 0,
                          bottom: 0,
                          width: 100,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer.withOpacity(
                                0.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        // 导航项
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: _buildNavItem(
                                Icons.home,
                                '主页',
                                0,
                                colorScheme,
                              ),
                            ),
                            Expanded(
                              child: _buildNavItem(
                                Icons.person,
                                '我的',
                                1,
                                colorScheme,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // 仅在窄屏设备显示底部导航栏
      bottomNavigationBar:
          isWideScreen
              ? null
              : BottomNavigationBar(
                backgroundColor: colorScheme.surfaceContainerLow, // 设置透明背景
                elevation: 0, // 移除阴影
                selectedItemColor: colorScheme.onSurface,
                unselectedItemColor: colorScheme.onSurfaceVariant,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), // 未选中时使用镂空图标
                    activeIcon: Icon(Icons.home), // 选中时使用实心图标
                    label: '主页',
                    backgroundColor: Colors.transparent, // 确保项目背景透明
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), // 未选中时使用镂空图标
                    activeIcon: Icon(Icons.person), // 选中时使用实心图标
                    label: '我的',
                    backgroundColor: Colors.transparent, // 确保项目背景透明
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
    );
  }

  // 构建导航项
  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    ColorScheme colorScheme,
  ) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color:
                    isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
