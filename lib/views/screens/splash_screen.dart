// lib/views/screens/splash_screen.dart
import 'package:flutter/material.dart';
import '../../controllers/splash_controller.dart';
import '../widgets/circular_loader.dart';
import '../widgets/rounded_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.initialize().then((_) {
      Navigator.of(context).pushReplacementNamed('/get-started');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedImage(
              imagePath: 'assets/seyahat.png', // Replace with your logo path
              width: 100,
              height: 100,
              borderRadius: 30.0,
            ),
            SizedBox(height: 20),
            CircularLoader(),
          ],
        ),
      ),
    );
  }
}
