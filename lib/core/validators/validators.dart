// lib/constants/validators.dart
String? validateEmail(String email) {
  email = email.trim();
  if (email.isEmpty) {
    return "Email cannot be empty";
  }
  final emailRegex = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
  if (!emailRegex.hasMatch(email)) {
    return "Enter a valid email address";
  }
  return null;
}

String? validatePassword(String password) {
  password = password.trim();
  if (password.isEmpty) {
    return "Password cannot be empty";
  }
  if (password.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}
