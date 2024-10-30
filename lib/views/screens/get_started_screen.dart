// lib/views/screens/get_started_screen.dart
import 'package:flutter/material.dart';
import '../widgets/rounded_image.dart';
import '../widgets/text_widget.dart';
import '../widgets/get_started_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                RoundedImage(
                  imagePath: 'assets/seyahat.png',
                  height: 150,
                ),
                SizedBox(height: 20),
                TextWidget(
                  text: "DISCOVER YOUR NEXT ADVENTURE WITH\nOUR TRUSTED GUIDES!",
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          const Spacer(),
          GetStartedButton(
            onTap: () {
              print("navigating to logi page");
              Navigator.pushNamed(context, '/login'); // Navigate to LoginPage
            },
          ),
        ],
      ),
    );
  }
}
