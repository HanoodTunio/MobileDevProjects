// lib/controllers/guide_controller.dart

import 'package:flutter/material.dart';
import '../models/guide_model.dart';

class GuideController extends ChangeNotifier {
  List<Guide> _guides = [];
  bool _isLoading = false;
  String? _error;

  List<Guide> get guides => _guides;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch guide data (dummy data for now)
  Future<void> fetchGuides(String query) async {
    _isLoading = true;
    notifyListeners();

    // Simulate network request delay
    await Future.delayed(const Duration(seconds: 1));

    // Uncomment the API code when ready to use it
    /*
    try {
      final response = await GuideService().searchGuides(query);
      _guides = response;
      _error = null;
    } catch (e) {
      _error = 'Failed to fetch guides';
    }
    */

    // Dummy data for now
    _guides = [
      Guide(
        username: 'John Doe',
        profilePicture: 'assets/profile.png',
        description: 'Experienced guide with 10 years of expertise in mountain trails.',
        rating: 4.5,
        reviewCount: 150,
      ),
      Guide(
        username: 'Jane Smith',
        profilePicture: 'assets/profile.png',
        description: 'Specializes in city tours with deep knowledge of cultural landmarks.',
        rating: 4.0,
        reviewCount: 85,
      ),
      Guide(
        username: 'Tom Brown',
        profilePicture: 'assets/profile.png',
        description: 'Nature enthusiast with excellent skills in wildlife and forest tours.',
        rating: 4.8,
        reviewCount: 200,
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
