// lib/controllers/signup_role_selection_controller.dart
import 'package:flutter/material.dart';
import '../views/screens/guide/guide_signup_screen.dart';
import '../views/screens/user_signup_screen.dart';

/// The controller class for the SignupRoleSelectionScreen.
/// This class contains the navigation logic for the screen.
/// It handles the navigation to the UserSignupScreen and GuideSignupScreen.
/// It is responsible for navigating to the appropriate sign-up screen based on the user_profile.dart's selection.
class SignupRoleSelectionController {

  /// Navigates to the User sign-up screen.
  /// @param context The BuildContext to use for navigation
  void navigateToUserSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserSignupScreen()),
    );
  }

  /// Navigates to the Guide sign-up screen.
  /// @param context The BuildContext to use for navigation
  void navigateToGuideSignup(BuildContext context) {
    // Navigate to the actual Guide sign-up screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuideSignUpScreen()), // Navigate to GuideSignUpPage
    );
  }
}
