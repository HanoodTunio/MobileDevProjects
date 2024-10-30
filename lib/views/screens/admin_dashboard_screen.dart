// lib/views/screens/admin_dashboard_screen.dart

import 'package:flutter/material.dart';
import '../widgets/admin_action_card.dart';
import 'manage_guide_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  void onManageGuide(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ManageGuidesScreen()),
    );
  }


  void _onIssueResolution() {
    print("Issue Resolution clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Admin",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AdminActionCard(
              title: "Manage Guide",
              count: 2,
              onPressed: () => onManageGuide(context), // Wrap in an anonymous function
            ),
            AdminActionCard(
              title: "Issue Resolution",
              count: 1,
              onPressed: _onIssueResolution,
            ),
          ],
        ),
      ),
    );
  }
}