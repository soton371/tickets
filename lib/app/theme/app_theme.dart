import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
    ),
    fontFamily: "Montserrat",
    dividerTheme: DividerThemeData(color: AppColors.divider),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.badge,
          backgroundColor: AppColors.buttonBackground,
          textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: AppSizes.fontSizeLarge)
      )
    )
  );
}
