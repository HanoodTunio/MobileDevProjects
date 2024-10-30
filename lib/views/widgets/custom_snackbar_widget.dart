// lib/views/widgets/custom_snackbar.dart
import 'package:flutter/material.dart';

/// Custom SnackBar widget to show a SnackBar with customizable message, color, and duration.
class CustomSnackBar {
  /// Shows a SnackBar with the given message, background color, text color, and duration.
  static void show(
    BuildContext context, {
      required String message,
      Color backgroundColor = Colors.grey,
      Duration duration = const Duration(seconds: 2),
      Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
