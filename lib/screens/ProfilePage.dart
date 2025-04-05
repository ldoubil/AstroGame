import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取当前主题的颜色
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: colorScheme.primary,
            child: Icon(Icons.person, size: 50, color: colorScheme.onPrimary),
          ),
          const SizedBox(height: 16),
          Text(
            '我的个人中心',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildProfileItem(context, Icons.settings, '设置'),

          _buildProfileItem(context, Icons.help, '帮助与反馈'),
        ],
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(icon, color: colorScheme.primary),
          title: Text(title),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          onTap: () {
            // 点击处理逻辑
          },
        ),
      ),
    );
  }
}
