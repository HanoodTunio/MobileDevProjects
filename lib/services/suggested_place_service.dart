// lib/services/place_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/suggested_place_model.dart';


class PlaceService {
  final String apiUrl = "https://api.example.com/places"; // Your API URL

  // Fetch suggested places from the API
  Future<List<SuggestedPlace>> getSuggestedPlaces() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // Parse the JSON response
      return data.map((place) => SuggestedPlace.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load suggested places');
    }
  }
}
