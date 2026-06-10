import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tim_ve_ui/core/router/app_router.dart';
import 'package:tim_ve_ui/core/theme/app_colors.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const _tabs = [
    _ShellTab(
      route: AppRoutes.home,
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Trang chủ',
    ),
    _ShellTab(
      route: AppRoutes.favorites,
      icon: Icons.favorite_outline,
      activeIcon: Icons.favorite,
      label: 'Yêu thích',
    ),
    _ShellTab(
      route: AppRoutes.notifications,
      icon: Icons.notifications_outlined,
      activeIcon: Icons.notifications,
      label: 'Thông báo',
    ),
    _ShellTab(
      route: AppRoutes.profile,
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Hồ sơ',
    ),
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _tabs.indexWhere((tab) => location.startsWith(tab.route));
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => context.go(_tabs[index].route),
          items: [
            for (final tab in _tabs)
              BottomNavigationBarItem(
                icon: Icon(tab.icon),
                activeIcon: Icon(tab.activeIcon),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}

class _ShellTab {
  const _ShellTab({
    required this.route,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final String route;
  final IconData icon;
  final IconData activeIcon;
  final String label;
}
