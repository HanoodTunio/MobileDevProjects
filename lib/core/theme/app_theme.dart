// lib/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:seyahat_app/core/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Define primary color scheme
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

    // Define font style and color for the AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF164C94),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
