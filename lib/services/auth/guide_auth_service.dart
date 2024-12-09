// lib/services/guide_auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class GuideAuthService {
  final String baseUrl = 'https://your-backend-api.com';

  /// Registers a new guide by sending a POST request to the server.
  /// @param All relevant user_profile.dart data including personal information and image path.
  /// @return `true` if registration is successful, `false` otherwise.
  Future<bool> registerGuide({
    required String name,
    required String cnic,
    required String phone,
    required String email,
    required String password,
    required String experienceLevel,
    required String language,
    required String specialties,
    required String certification,
    required String availability,
    required String about,
    String? socialMediaLinks,
    String? paymentMethod,
    String? idCardImagePath,
  }) async {
    final String url = '$baseUrl/api/guide/register';

    // Create a map to hold the form data
    final Map<String, String> body = {
      'name': name,
      'cnic': cnic,
      'phone': phone,
      'email': email,
      'password': password,
      'experienceLevel': experienceLevel,
      'language': language,
      'specialties': specialties,
      'certification': certification,
      'availability': availability,
      'about': about,
      'socialMediaLinks': socialMediaLinks ?? '',
      'paymentMethod': paymentMethod ?? '',
    };

    try {
      // Initialize the multipart request
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add all text fields to the request
      body.forEach((key, value) {
        request.fields[key] = value;
      });

      // Attach image file if provided
      if (idCardImagePath != null && idCardImagePath.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath('idCardImage', idCardImagePath),
        );
      }

      // Send the request to the server and await the response
      var response = await request.send();

      // Read and log the response for debugging purposes
      final responseBody = await response.stream.bytesToString();
      print("Response status: ${response.statusCode}");
      print("Response body: $responseBody");

      // Check if the registration was successful
      return response.statusCode == 201;
    } catch (e) {
      print('An error occurred during guide registration: $e');
      return false;
    }
  }
}
