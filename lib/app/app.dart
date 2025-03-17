import 'package:flutter/material.dart';
import 'package:tickets/app/routes/app_router.dart';
import 'package:tickets/app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
