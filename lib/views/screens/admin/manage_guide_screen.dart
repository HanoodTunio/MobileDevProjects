// lib/views/screens/manage_guides_screen.dart

import 'package:flutter/material.dart';
import '../../../models/guide_details_model.dart';
import '../../widgets/admin/guide_row.dart';
import 'guide_details_screen.dart';

class ManageGuidesScreen extends StatelessWidget {
  const ManageGuidesScreen({super.key});

  Color _getStatusColor(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "Pending":
      default:
        return Colors.orange; // Suitable color for pending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Manage Guides",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      color: Colors.grey[200],
                      child: const Row(
                        children: [
                          Expanded(flex: 1, child: Text("Sr no", textAlign: TextAlign.center)),
                          Expanded(flex: 2, child: Text("Guide id", textAlign: TextAlign.center)),
                          Expanded(flex: 2, child: Text("Guide name", textAlign: TextAlign.center)),
                          Expanded(flex: 2, child: Text("Status", textAlign: TextAlign.center)),
                          Expanded(flex: 1, child: Text("Action", textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5, // Replace with the actual number of guides
                        itemBuilder: (context, index) {
                          final status = index == 2 ? "Approved" : index == 4 ? "Rejected" : "Pending";
                          return GuideRow(
                            srNo: (index + 1).toString(),
                            guideId: "023-34-001",
                            guideName: "Shahzaib",
                            status: status,
                            statusColor: _getStatusColor(status), // Pass status color
                            onActionTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) => _buildActionDialog(dialogContext),
                              );
                            },
                            onRowTap: () {
                              // Navigate to GuideDetailsScreen with GuideDetails instance
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GuideDetailsScreen(
                                    guideDetails: GuideDetails(
                                      id: "023-34-001",
                                      username: "Shahzaib",
                                      profilePicture: "https://example.com/profile.jpg",
                                      bio: "A passionate guide with extensive experience.",
                                      contactInfo: "+123456789",
                                      email: "guide@example.com",
                                      experience: "5 years",
                                      language: "English, Spanish",
                                      specialties: "Historical tours, Food tours",
                                      certificate: "Certified Guide",
                                      socialMediaLinks: "@guideprofile",
                                      status: status,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionDialog(BuildContext dialogContext) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.check_circle, color: Colors.blue, size: 36),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.blue, size: 36),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
          ],
        ),
      ),
    );
  }
}
