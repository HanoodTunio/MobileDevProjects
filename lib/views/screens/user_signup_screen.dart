// lib/views/screens/user_signup_screen.dart
import 'package:flutter/material.dart';
import 'package:seyahat_app/controllers/user_signup_controller.dart';

import '../../services/auth/auth_service.dart';
import '../../core/constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield_widget.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({Key? key}) : super(key: key);

  @override
  _UserSignupScreenState createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  late final UserSignupController _signupController;

  @override
  void initState() {
    super.initState();
    _signupController = UserSignupController(
      usernameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      authService: AuthService(baseUrl: "https://example.com/api"), // Set your API base URL here
    );
  }

  @override
  void dispose() {
    _signupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.shadowColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Sign Up',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Already have an account?',
                fontSize: 16,
                color: AppColors.primaryTextColor,
              ),
              const SizedBox(height: 5),
              CustomText(
                text: 'Login',
                color: AppColors.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(height: 35),
              CustomTextField(
                controller: _signupController.usernameController,
                hintText: 'Username',
                prefixIcon: const Icon(Icons.person, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _signupController.emailController,
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 10),
              PasswordTextField(controller: _signupController.passwordController),
              const SizedBox(height: 45),
              CustomButton(
                label: 'Sign Up',
                onPressed: () => _signupController.handleUserSignup(context),
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
