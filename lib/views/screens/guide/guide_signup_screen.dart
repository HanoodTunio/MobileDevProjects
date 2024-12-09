import 'package:flutter/material.dart';

import '../../widgets/custom_password_field.dart';
import '../../widgets/custom_textfield_widget.dart';
import 'guide_signup_screen2.dart';


class GuideSignUpScreen extends StatelessWidget {
  const GuideSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cnicController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Join as a Guide',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 37),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF9800),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cnicController,
              hintText: 'CNIC',
              prefixIcon: const Icon(Icons.account_box, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneController,
              hintText: 'Phone Number',
              prefixIcon: const Icon(Icons.phone, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)),
            ),
            const SizedBox(height: 10),
            PasswordTextField(controller: passwordController),
            const SizedBox(height: 45),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GuideSignUpScreen2(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
