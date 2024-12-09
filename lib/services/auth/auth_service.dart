// lib/services/auth_service.dart
import 'dart:convert';
import "package:http/http.dart" as http;

class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      // final response = await http.post(
      //   url,
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode({
      //     'email': email,
      //     'password': password,
      //   }),
      // );
      //
      // if (response.statusCode == 200) {
      //   // Handle successful login, for example, by parsing a token
      //   return true;
      // } else {
      //   print("Failed to log in: ${response.body}");
      //   return false;
      // }
      return true;
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }

  /**
   * Register a new user_profile.dart with the given email and password by hitting  endpoint.
   *
   */
  Future<bool> register(String userame,String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      // final response = await http.post(
      //   url,
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode({
      //     'email': email,
      //     'password': password,
      //   }),
      // );
      //
      // if (response.statusCode == 200) {
      //   // Handle successful registration, for example, by parsing a token
      //   return true;
      // } else {
      //   print("Failed to register: ${response.body}");
      //   return false;
      // }
      return true;
    } catch (e) {
      print("Error during registration: $e");
      return false;
    }
  }

  /// Send a password reset link to the user_profile.dart's email address
  Future<bool> sendPasswordResetLink(String email) async {
    // Simulate API request - replace with actual HTTP request logic
    await Future.delayed(const Duration(seconds: 2));

    // For now, return true for a successful request
    return true;
  }
}
