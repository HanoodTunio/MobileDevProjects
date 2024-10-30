// lib/views/screens/forgot_password_screen.dart

import 'package:flutter/material.dart';
import 'package:seyahat_app/controllers/forgot_password_controller.dart';
import '../../services/auth/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  late final ForgotPasswordController _forgotPasswordController = ForgotPasswordController(authService: AuthService(baseUrl: "https://example.com/api"));

  void _handleForgotPassword() {
    _forgotPasswordController.sendPasswordResetLink(context);
  }

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: const Color(0xFF1A76D2),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Enter your email to receive a password reset link.",
              style: TextStyle(color: Colors.black54, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: _forgotPasswordController.emailController,
              hintText: "Email",
              prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Send Reset Link",
              onPressed: _handleForgotPassword,
              backgroundColor: const Color(0xFF1A76D2),
            ),
          ],
        ),
      ),
    );
  }
}
