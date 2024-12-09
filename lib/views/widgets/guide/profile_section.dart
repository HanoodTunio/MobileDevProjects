import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final double screenWidth;

  const ProfileSection({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.15,
            backgroundImage: const AssetImage('assets/profile.png'),
          ),
          const SizedBox(height: 16),
          Text(
            "Arden Jhone",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.06,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "@Arden_Jhone",
            style: TextStyle(
              color: Colors.grey,
              fontSize: screenWidth * 0.04,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star_border, color: Colors.amber),
              Icon(Icons.star_border, color: Colors.amber),
              Icon(Icons.star_border, color: Colors.amber),
              SizedBox(width: 8),
              Text("2.0 (2)"),
            ],
          ),
        ],
      ),
    );
  }
}
