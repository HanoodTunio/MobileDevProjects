import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController extends ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  // Load the user_profile.dart profile data from the API
  Future<void> loadUserProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _userService.getUserProfile();
    } catch (e) {
      print("Error loading user_profile.dart profile: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Update the user_profile.dart profile by sending it to the API
  Future<void> updateUserProfile(UserModel updatedUser) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _userService.updateUserProfile(updatedUser);
      _user = updatedUser;
    } catch (e) {
      print("Error updating user_profile.dart profile: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
