import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../views/widgets/custom_snackbar_widget.dart';

/// Controller class for the User sign-up screen. This class contains
/// the logic for handling user_profile.dart sign-up. It takes the user_profile.dart input from the
/// text fields and sends it to the AuthService to create a new user_profile.dart.
/// It has a method to handle the user_profile.dart sign-up and a method to dispose
class UserSignupController{

  // Text editing controllers for the input fields in the sign-up form
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // AuthService instance to make API calls
  final AuthService authService;

  /// Constructor for the UserSignupController class. It takes the text editing controllers
  /// for the input fields and an instance of the AuthService.
  /// @param usernameController The text editing controller for the username field
  /// @param emailController The text editing controller for the email field
  /// @param passwordController The text editing controller for the password field
  /// @param authService The instance of the AuthService
  UserSignupController({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.authService,
  });


  /// Register a new user_profile.dart with the given email and password by hitting  endpoint
  /// @param context The BuildContext of the screen
  /// @return A Future that resolves to void
  /// @throws Exception if the user_profile.dart creation fails
  /// @throws Exception if any of the fields are empty
Future<void> handleUserSignup(BuildContext context) async {

    // Check if any of the fields are empty
    if (usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackBar.show(
        context,
        message: 'Please fill all the fields.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );
      return;
    }

    /// Make a request to the server to create a new user_profile.dart
    /// The register method returns a boolean value indicating whether the user_profile.dart was created successfully
    /// or not. If the user_profile.dart is created successfully, show a success message and navigate to the login screen.
    bool isUserCreated = await authService.register(
      usernameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (isUserCreated) {
      CustomSnackBar.show(
        context,
        message: 'Sign-Up Successful. Please login to continue.',
        backgroundColor: Colors.white70,
        textColor: Colors.green,
      );
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      CustomSnackBar.show(
        context,
        message: 'Sign-Up Failed. Please try again.',
        backgroundColor: Colors.white70,
        textColor: Colors.red,
      );

    }
  }

/// Validate the email address entered by the user_profile.dart.
void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

