// lib/services/guide_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/guide_model.dart';
import '../models/review_model.dart';

class GuideService {
  final String apiUrl = 'https://api.example.com/guides';

  Future<List<Guide>> searchGuides(String query) async {
    final response = await http.get(Uri.parse('$apiUrl?search=$query'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Guide.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load guides');
    }
  }

  // Fetch reviews for a specific guide
  // Dummy fetchReviews method
  Future<List<Review>> fetchReviews(String guideUsername) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Return dummy reviews
    return [
      Review(
        username: 'Alice',
        comment: 'An excellent guide! Really knows the area well.',
        rating: 5.0,
      ),
      Review(
        username: 'Bob',
        comment: 'Very friendly and knowledgeable.',
        rating: 4.5,
      ),
      Review(
        username: 'Charlie',
        comment: 'Had a great experience, would recommend!',
        rating: 4.0,
      ),
      Review(
        username: 'Diana',
        comment: 'Good guide, but could improve on time management.',
        rating: 3.5,
      ),
      Review(
        username: 'Eve',
        comment: 'Amazing tour! Highly recommended.',
        rating: 5.0,
      ),
    ];
  }
}
