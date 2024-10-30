// lib/views/screens/guide_details_screen.dart

import 'package:flutter/material.dart';

class GuideDetailsScreen extends StatelessWidget {
  final String guideId;
  final String guideName;
  final String status;

  const GuideDetailsScreen({
    Key? key,
    required this.guideId,
    required this.guideName,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide Details"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Guide ID: $guideId", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Guide Name: $guideName", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Status: $status", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            // Additional details or actions can go here
          ],
        ),
      ),
    );
  }
}
