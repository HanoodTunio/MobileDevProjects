// lib/routing/app_router.dart
import 'package:flutter/material.dart';
import 'package:seyahat_app/views/screens/get_started_screen.dart';
import 'package:seyahat_app/views/screens/login_screen.dart';
import 'package:seyahat_app/views/screens/signup_role_selection_screen.dart';
import 'package:seyahat_app/views/screens/user_signup_screen.dart';

import '../views/screens/splash_screen.dart';


class AppRouter {

  static const String splash = '/';
  static const String getStarted = '/get-started';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String userSignup = '/user-signup';
  static const String guideSignup = '/guide-signup';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case home:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen(onLoginSuccess: () {
          Navigator.pushReplacementNamed(_, home);
        },));
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupRoleSelectionScreen());
      case userSignup:
        return MaterialPageRoute(builder: (_) => const UserSignupScreen());
      case guideSignup:
        return MaterialPageRoute(builder: (_) => const UserSignupScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}
