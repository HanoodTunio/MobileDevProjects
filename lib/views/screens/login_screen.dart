// lib/views/screens/authentication/login_page.dart
import 'package:flutter/material.dart';
import 'package:seyahat_app/views/screens/signup_role_selection_screen.dart';
import 'package:seyahat_app/views/widgets/custom_snackbar_widget.dart';
import '../../core/constants/admin_credentials.dart';
import '../../services/auth/auth_service.dart';
import '../../../controllers/login_controller.dart';
import '../widgets/custom_button.dart'; // Custom button widget
import '../widgets/custom_password_field.dart'; // Password field widget
import '../widgets/custom_text.dart'; // Custom text widget
import '../widgets/custom_textfield_widget.dart';
import 'admin/admin_dashboard_screen.dart'; // Custom text field widget

class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginScreen({
    Key? key,
    required this.onLoginSuccess,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  late final LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      authService:
          AuthService(baseUrl: "https://example.com/api"), // Mocked API for now
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Check for admin credentials
    if (_loginController.emailController.text == adminUsername &&
        _loginController.passwordController.text == adminPassword) {
      // Navigate directly to Admin Dashboard if admin credentials match
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
      );
    } else {
      // Regular user_profile.dart login
      final isSuccess = await _loginController.login(context);
      if (isSuccess) {
        widget.onLoginSuccess();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A76D2),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                      width: 5), // Adds spacing between text and link
                  CustomText(
                    text: "Sign Up",
                    color: const Color(0xFFFF7F50),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignupRoleSelectionScreen(), // Removed const here
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              CustomTextField(
                controller: _loginController.emailController,
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)),
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                  controller: _loginController.passwordController),
              const SizedBox(height: 10),

              // Align "Forgot Password?" text to the right
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to right
                children: [
                  CustomText(
                    text: "Forgot Password?",
                    color:
                        const Color(0xFF4C4C4C), // Darker color for visibility
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    onTap: () => _loginController.navigateToForgotPassword(context),

                  ),
                ],
              ),

              const SizedBox(height: 50),
              CustomButton(
                label: "Login",
                onPressed: _handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
