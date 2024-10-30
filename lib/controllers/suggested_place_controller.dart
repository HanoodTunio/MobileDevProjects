// lib/controllers/suggested_place_controller.dart

import 'package:flutter/material.dart';

import '../models/suggested_place_model.dart';

class SuggestedPlaceController extends ChangeNotifier {
  List<SuggestedPlace> _places = [];
  bool _isLoading = false;
  String? _error;

  List<SuggestedPlace> get places => _places;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch dummy data instead of calling an API
  void fetchSuggestedPlaces() {
    _isLoading = true;
    notifyListeners();

    // Simulate a delay to mock a network request
    Future.delayed(const Duration(seconds: 1), () {
      // Commented out API call, using dummy data instead.
      // In the future, replace this with actual API call:
      // final response = await PlaceService().getSuggestedPlaces();

      // Hardcoded dummy data for now
      _places = [
        SuggestedPlace(
          placeName: 'Shangrilla Lake',
          imagePath: 'assets/view2.png', // Ensure this image exists in your assets folder
          description: 'Shangrilla Lake is one of the most beautiful lakes in Pakistan. It is surrounded by mountains and offers breathtaking views. The lake is known for its crystal-clear water and serene environment. A must-visit for nature lovers and adventurers.',
        ),
        SuggestedPlace(
          placeName: 'Fairy Meadows',
          imagePath: 'assets/view.png', // Using the same image for now
          description: 'Fairy Meadows offers a breathtaking view of Nanga Parbat, the 9th highest mountain in the world. It is a famous destination for trekkers and adventure lovers. The lush green plateau, with a majestic view of Nanga Parbat, is a highlight for tourists.',
        ),
        SuggestedPlace(
          placeName: 'Fairy Meadows',
          imagePath: 'assets/view2.png', // Using the same image for now
          description: 'Fairy Meadows offers a breathtaking view of Nanga Parbat, the 9th highest mountain in the world. It is a famous destination for trekkers and adventure lovers. The lush green plateau, with a majestic view of Nanga Parbat, is a highlight for tourists.',
        ),
        SuggestedPlace(
          placeName: 'Fairy Meadows',
          imagePath: 'assets/view.png', // Using the same image for now
          description: 'Fairy Meadows offers a breathtaking view of Nanga Parbat, the 9th highest mountain in the world. It is a famous destination for trekkers and adventure lovers. The lush green plateau, with a majestic view of Nanga Parbat, is a highlight for tourists.',
        ),
      ];

      _isLoading = false;
      notifyListeners(); // Notify listeners that the data is updated
    });
  }
}
