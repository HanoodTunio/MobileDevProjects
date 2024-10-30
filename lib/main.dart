import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seyahat_app/controllers/user_controller.dart';
import 'package:seyahat_app/views/screens/get_started_screen.dart';
import 'package:seyahat_app/views/screens/home_screen.dart';
import 'package:seyahat_app/views/screens/login_screen.dart';
import 'package:seyahat_app/views/screens/search_guide_screen.dart';
import 'package:seyahat_app/views/screens/user_notification_screen.dart';
import 'package:seyahat_app/views/screens/user_setting_screen.dart';
import 'controllers/message_controller.dart';
import 'controllers/notification_controller.dart';
import 'core/theme/app_theme.dart';
import 'views/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()..loadUserProfile()),
        ChangeNotifierProvider(create: (_) => MessageController()),
        ChangeNotifierProvider(create: (_) => NotificationController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with Controller',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/get-started': (context) => GetStartedScreen(),
        '/login': (context) => LoginScreen(
          onLoginSuccess: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        '/notifications': (context) => UserNotificationScreen(),
        '/search': (context) => SearchGuideScreen(),
        '/settings': (context) => UserSettingsScreen(),
      },
    );
  }
}
