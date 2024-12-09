import 'package:flutter/material.dart';
import '../../widgets/admin/issue_card.dart';
import 'view_issue_screen.dart'; // Import ViewIssueScreen

class IssueListScreen extends StatelessWidget {
  const IssueListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for issues
    final issues = [
      {
        "name": "Sandeep",
        "phone": "+1234567890",
        "email": "sandeep@gmail.com",
        "country": "Pakistan",
        "role": "Guide",
        "date": "Sept 26, 2024",
        "description": "I'm unable to upload my certification documents due to an error message. Please assist.",
      },
      {
        "name": "User",
        "phone": "+9876543210",
        "email": "user_profile.dart@gmail.com",
        "country": "India",
        "role": "User",
        "date": "Sept 27, 2024",
        "description": "Thank you for contacting me. I am here to help you out.",
      },
      // Add more issues as needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "View Issues",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: issues.length,
        itemBuilder: (context, index) {
          final issue = issues[index];
          return IssueCard(
            raisedBy: issue["role"]!, // Use role to represent "raised by"
            description: issue["description"]!,
            onView: () {
              // Navigate to the detailed issue view screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewIssueScreen(
                    name: issue["name"]!,
                    phone: issue["phone"]!,
                    email: issue["email"]!,
                    country: issue["country"]!,
                    role: issue["role"]!,
                    date: issue["date"]!,
                    description: issue["description"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
