import 'package:flutter/material.dart';

class GuideProfilePage extends StatelessWidget {
  const GuideProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guide Profile"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image and Name
              CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150', // Replace with the actual profile image URL
                ),
              ),
              const SizedBox(height: 16),
              // Username and Handle
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
              // Ratings
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  Icon(Icons.star_border, color: Colors.amber),
                  SizedBox(width: 8),
                  Text("2.0 (2)"),
                ],
              ),
              const SizedBox(height: 16),
              // Tab Bar
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.blueAccent,
                      tabs: const [
                        Tab(text: "About"),
                        Tab(text: "Reviews"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // About Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Column(
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
                            "Hey! There I am a passionate tourist guide. "
                                "I love to show around new places and share my knowledge. "
                                "Let's make your trip memorable!",
                          ),
                          SizedBox(height: 16),
                          // User Details
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
                          // Languages Section
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
