import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String placeName;
  final String imagePath;
  final String description;

  const PlaceDetailScreen({
    super.key,
    required this.placeName,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          placeName,
          style: const TextStyle(color: Colors.black),  // Title text color to black
        ),
        backgroundColor: Colors.white,  // Set background color to white
        iconTheme: const IconThemeData(
          color: Colors.black,  // Set arrow (back button) color to black
        ),
        elevation: 0,  // Remove shadow if desired
      ),
      body: SingleChildScrollView(  // Allow scrolling if content is long
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full width image with no rounded corners
            Image.asset(
              imagePath,
              height: 250,
              width: double.infinity,  // Make image take full width of screen
              fit: BoxFit.cover,  // Ensure the image covers the entire width
            ),
            const SizedBox(height: 30),
            // Padding for the content

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Place Name
                  Text(
                    placeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 35),
                  // Full Description
                  const Divider(
                    color: AppColors.lightGrey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      height: 1.5,  // Line height for readability
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
