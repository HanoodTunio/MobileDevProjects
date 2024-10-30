import 'package:flutter/material.dart';
import '../screens/place_detail_screen.dart';
import 'custom_button.dart';

class SuggestedPlaceCard extends StatelessWidget {
  final String placeName;
  final String imagePath;
  final String description;

  const SuggestedPlaceCard({
    super.key,
    required this.placeName,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      color: Colors.white70, // Lightened card color
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Place Name
            Text(
              placeName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.5, // Line height for better readability
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // Button directly after description with no extra space
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align the button to the right
              children: [
                CustomButton(
                  label: "Explore more",
                  onPressed: () {
                    // Navigate to PlaceDetailScreen with the data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaceDetailScreen(
                          placeName: placeName,
                          imagePath: imagePath,
                          description: description,
                        ),
                      ),
                    );
                  },
                  backgroundColor: const Color(0xFF327CDD),
                  borderRadius: 8.0,
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  fontSize: 11.0, // Slightly larger font for a professional look
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
