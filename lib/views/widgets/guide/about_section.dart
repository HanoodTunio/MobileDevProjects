import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Hey! I am a passionate tourist guide. I love showing new places and making trips memorable. Let's explore together!",
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("From Pakistan"),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("Member Since Sep 2021"),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.history, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("Last Delivery About 41 weeks ago"),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Languages",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.language, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("English: Conversational"),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.language, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("Urdu: Fluent"),
            ],
          ),
        ],
      ),
    );
  }
}
