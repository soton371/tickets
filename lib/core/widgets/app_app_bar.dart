import 'package:flutter/material.dart';
import 'package:tickets/core/constants/constants.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, this.isNotification = false, this.title});
  final bool isNotification;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Text(title ?? "Gain Solutions"),
      actions: [
        if(isNotification)
          IconButton(
            onPressed: () {},
            icon: Badge(
              backgroundColor: AppColors.badge,
              label: Text("3"),
              child: Icon(Icons.notifications_none,color: AppColors.title),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
