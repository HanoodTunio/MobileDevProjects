// lib/views/screens/guide_details_screen.dart

import 'package:flutter/material.dart';

import '../../../models/guide_details_model.dart';

class GuideDetailsScreen extends StatelessWidget {
  final GuideDetails guideDetails;

  const GuideDetailsScreen({
    Key? key,
    required this.guideDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Guide Information", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Profile Picture
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/user2.png"),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Text(
              "Guide Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Guide Information
            _buildInfoRow("Name", guideDetails.username),
            _buildInfoRow("CNIC", guideDetails.contactInfo),
            _buildInfoRow("Phone Number", guideDetails.contactInfo),
            _buildInfoRow("Email", guideDetails.email),
            _buildInfoRow("Experience", guideDetails.experience),
            _buildInfoRow("Language", guideDetails.language),
            _buildInfoRow("Specialties", guideDetails.specialties),
            _buildInfoRow("Certificate", guideDetails.certificate),
            _buildInfoRow("Social Media Links", guideDetails.socialMediaLinks),
            _buildInfoRow("Bio", guideDetails.bio),
          ],
        ),
      ),
    );
  }

  // Helper method to create rows with a shaded, rounded style
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Light grey background
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
