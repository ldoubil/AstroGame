import 'dart:io';
import 'package:astro_game/screens/RoomPage.dart';
import 'package:flutter/material.dart';
import 'package:astro_game/screens/HomePage.dart';
import 'package:astro_game/screens/ProfilePage.dart';
import 'package:astro_game/widgets/theme_selector.dart'; // 添加主题选择器导入
import 'package:astro_game/widgets/window_control.dart'; // 添加窗口控制导入
import 'package:astro_game/k/AppState.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:window_manager/window_manager.dart'; // 添加

// 添加菜单项配置类
class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget page;

  const NavigationItem({
    required this.icon,
    IconData? activeIcon,
    required this.label,
    required this.page,
  }) : activeIcon = activeIcon ?? icon;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// 添加 SingleTickerProviderStateMixin 以支持动画控制器
class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  // 添加动画控制器
  late final AnimationController _controller;
  // 添加鼠标悬停状态跟踪
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 定义菜单项配置
  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: '主页',
      page: const HomePage(),
    ),
    NavigationItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: '聊天',
      page: const RoomPage(),
    ),
    NavigationItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: '我的',
      page: const ProfilePage(),
    ),
  ];

  // 替换原有的 _pages 定义
  List<Widget> get _pages => _navigationItems.map((item) => item.page).toList();

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
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    // 修改判断逻辑：宽度大于 1024 像素时使用桌面布局
    final isDesktop = screenWidth > AppState().screenSplitWidth.value;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(36),
        child: GestureDetector(
          onPanStart: (details) {
            if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
              windowManager.startDragging();
            }
          },
          child: AppBar(
            title: const Text('AstroGame', style: TextStyle(fontSize: 18)),
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            toolbarHeight: 36,
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
                icon: const Icon(Icons.color_lens, size: 20), // 减小图标大小
                onPressed: () => showThemeColorPicker(context),
                tooltip: '选择主题颜色',
                padding: const EdgeInsets.all(4), // 减小内边距
              ),
              if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
                const WindowControls(),
            ],
          ),
        ),
      ),
      // 移除 drawer，改用 Row 布局
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 80,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  right: BorderSide(
                    color: colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  // 添加滑动指示器
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    tween: Tween<double>(
                      begin: 4.0 + (_selectedIndex * 72.0),
                      end: 4.0 + (_selectedIndex * 72.0),
                    ),
                    builder: (context, value, child) {
                      return Positioned(
                        top: value,
                        left: 8,
                        right: 8,
                        height: 64,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ),
                  // 鼠标悬停指示器
                  if (_hoveredIndex != null && _hoveredIndex != _selectedIndex)
                    Positioned(
                      top: 4.0 + (_hoveredIndex! * 72.0),
                      left: 8,
                      right: 8,
                      height: 64,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  // 导航项列表
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _navigationItems.length,
                          itemBuilder: (context, index) {
                            final item = _navigationItems[index];
                            return _buildNavItem(
                              item.icon,
                              item.label,
                              index,
                              colorScheme,
                              item,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: _pages),
          ),
        ],
      ),
      // 保持移动端的底部导航栏
      bottomNavigationBar:
          isDesktop
              ? null
              : BottomNavigationBar(
                backgroundColor: colorScheme.surfaceContainerLow,
                elevation: 8, // 增加阴影
                type: BottomNavigationBarType.fixed, // 固定类型
                selectedItemColor: colorScheme.primary, // 使用主题主色
                unselectedItemColor: colorScheme.onSurfaceVariant,
                showUnselectedLabels: true, // 显示未选中项的标签
                items:
                    _navigationItems
                        .map(
                          (item) => BottomNavigationBarItem(
                            icon: Icon(item.icon),
                            activeIcon: Icon(item.activeIcon),
                            label: item.label,
                          ),
                        )
                        .toList(),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
    );
  }

  // 修改导航项构建方法
  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    ColorScheme colorScheme,
    dynamic item,
  ) {
    final isSelected = _selectedIndex == index;
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: Container(
        height: 64,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (_selectedIndex != index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color:
                    isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      isSelected ? item.activeIcon : item.icon,
                      color:
                          isSelected
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                      size: 24,
                      key: ValueKey(isSelected),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.label),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
