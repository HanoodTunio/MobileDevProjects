// lib/controllers/guide_controller.dart

import 'package:flutter/material.dart';
import '../models/guide_model.dart';
import '../services/guide_service.dart';

class GuideController extends ChangeNotifier {
  final GuideService _guideService = GuideService();

  //GuideModel? _guide;
  bool _isLoading = false;

  //GuideModel? get guide => _guide;
  bool get isLoading => _isLoading;

  // Load guide profile data
  Future<void> loadGuideProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
     // _guide = await _guideService.getGuideProfile();
    } catch (e) {
      print("Error loading guide profile: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Update guide profile information
  // Future<void> updateGuideProfile(GuideModel updatedGuide) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     await _guideService.updateGuideProfile(updatedGuide);
  //     _guide = updatedGuide;
  //   } catch (e) {
  //     print("Error updating guide profile: $e");
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }
}
