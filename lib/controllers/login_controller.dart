// lib/controllers/login_controller.dart
import 'package:flutter/material.dart';
import 'package:seyahat_app/views/screens/forgot_password_screen.dart';
import '../services/auth/auth_service.dart';
import '../core/validators/validators.dart' as validators;
import '../views/widgets/custom_snackbar_widget.dart'; // Alias the import

/// The controller class for the LoginScreen.
/// This class contains the logic for validating the user_profile.dart's input and handling the login process.
/// It takes the user_profile.dart input from the text fields and sends it to the AuthService to authenticate the user_profile.dart.
/// It has methods to validate the email and password fields, and a method to handle the login process.
/// It also has a method to dispose the text editing controllers.
class LoginController {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthService authService;

  //// Constructor for the LoginController class. It takes the text editing controllers
  /// for the email and password fields, and an instance of the AuthService.
  LoginController({
    required this.emailController,
    required this.passwordController,
    required this.authService,
  });

  /// Use the aliased validator functions
  String? validateEmail() => validators.validateEmail(emailController.text);
  String? validatePassword() => validators.validatePassword(passwordController.text);

  /// Method to handle the login process. It validates the user_profile.dart input, makes a request to the server
  /// to authenticate the user_profile.dart, and shows a snackbar with the result of the login process.
  /// @param context The BuildContext of the screen
  Future<bool> login(BuildContext context) async {
    // final emailError = validateEmail();
    // final passwordError = validatePassword();

   /// Check if there are any validation errors
    if (emailController.text.isEmpty || passwordController.text.isEmpty ) {
      /// If there are validation errors, show a snackbar with the error message
      // print("Validation error: $emailError, $passwordError");
      CustomSnackBar.show(
        context,
        message: 'Please enter valid email and password.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
      return false;
    }

    /// If there are no validation errors, make a request to the server to authenticate the user_profile.dart
    final isSuccess = await authService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (isSuccess) {
      CustomSnackBar.show(
        context,
        message: 'Login successful.',
        backgroundColor: Colors.white70,
        textColor: Colors.green,
      );
    } else {
      CustomSnackBar.show(
        context,
        message: 'Login failed. Please check your credentials.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
    }
    return isSuccess;
  }

  /// Dispose method to clean up the text editing controllers
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void navigateToForgotPassword(BuildContext context) {
    // Navigate to the Guide sign-up screen (if it exists)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()), // Placeholder screen for now
    );
  }
}
