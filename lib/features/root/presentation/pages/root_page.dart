import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tickets/app/routes/app_route_paths.dart';
import '../../../../core/constants/constants.dart';

class RootPage extends StatelessWidget {
  final Widget child;
  const RootPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go(AppRoutePaths.tickets);
              break;
            case 1:
              context.go(AppRoutePaths.contacts);
              break;
            case 2:
              context.go(AppRoutePaths.profile);
              break;
          }
        },
        shadowColor: AppColors.shadow,
        backgroundColor: AppColors.background,
        indicatorColor: AppColors.indicator,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.tickets_fill, color: AppColors.seed),
            icon: Icon(CupertinoIcons.tickets),
            label: 'Tickets',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person_2_fill, color: AppColors.seed),
            icon: Icon(CupertinoIcons.person_2),
            label: 'Contacts',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person_fill, color: AppColors.seed),
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutePaths.tickets)) return 0;
    if (location.startsWith(AppRoutePaths.contacts)) return 1;
    if (location.startsWith(AppRoutePaths.profile)) return 2;
    return 0;
  }
}
