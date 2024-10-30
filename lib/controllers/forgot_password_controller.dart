// lib/controllers/forgot_password_controller.dart

import 'package:flutter/material.dart';
import 'package:seyahat_app/views/widgets/custom_snackbar_widget.dart';
import '../services/auth/auth_service.dart';

class ForgotPasswordController {
  final TextEditingController emailController = TextEditingController();
  final AuthService authService;

  ForgotPasswordController({required this.authService});

  void dispose() {
    emailController.dispose();
  }

  /// Method to send a password reset link to the user's email address.
  /// It takes the BuildContext of the screen as a parameter.
  /// It validates the email address and sends a password reset link to the user's email.
  Future<void> sendPasswordResetLink(BuildContext context) async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      CustomSnackBar.show(
        context,
        message: 'Please enter a valid email address.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
      return;
    }

    final success = await authService.sendPasswordResetLink(email);

    if (success) {
      CustomSnackBar.show(
        context,
        message: 'Password reset link sent! Check your email.',
        backgroundColor: Colors.white70,
        textColor: Colors.green,
      );
    } else {
      CustomSnackBar.show(
        context,
        message: 'Failed to send password reset link. Please try again.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
    }
  }
}
