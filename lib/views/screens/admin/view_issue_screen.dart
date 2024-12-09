import 'package:flutter/material.dart';

import '../../widgets/admin/issue_action_buttons.dart';
import '../../widgets/admin/issue_details.dart';
import '../../widgets/admin/user_info_card.dart';



class ViewIssueScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String country;
  final String role;
  final String date;
  final String description;

  const ViewIssueScreen({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.role,
    required this.date,
    required this.description,
  }) : super(key: key);

  void _onProfilePressed() {
    print("Profile button pressed");
    // Navigate to profile or show profile details
  }

  void _onResolvedPressed() {
    print("Resolved button pressed");
    // Mark the issue as resolved or perform related action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "View Issue",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            IssueActionButtons(
              onProfilePressed: _onProfilePressed,
              onResolvedPressed: _onResolvedPressed,
            ),
            const SizedBox(height: 16.0),
            UserInfoCard(
              name: name,
              phone: phone,
              email: email,
              country: country,
              role: role,
            ),
            const SizedBox(height: 16.0),
            IssueDetails(
              date: date,
              description: description,
            ),
          ],
        ),
      ),
    );
  }
}
