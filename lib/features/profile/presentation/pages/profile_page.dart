import 'package:flutter/material.dart';
import 'package:tickets/core/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "My Profile",),
      body: Center(
        child: Text("ProfilePage"),
      ),
    );
  }
}
