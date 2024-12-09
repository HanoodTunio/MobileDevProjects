import 'package:flutter/material.dart';
import '../custom_button.dart'; // Import CustomButton

class IssueActionButtons extends StatelessWidget {
  final VoidCallback onProfilePressed;
  final VoidCallback onResolvedPressed;

  const IssueActionButtons({
    Key? key,
    required this.onProfilePressed,
    required this.onResolvedPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
      children: [
        // Custom Button for Profile
        CustomButton(
          label: "Sandeep Profile",
          onPressed: onProfilePressed,
          backgroundColor: Colors.blue,
          borderRadius: 20.0,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          fontSize: 16,
        ),
        const SizedBox(width: 8.0), // Spacing between buttons
        // Custom Button for Resolved
        CustomButton(
          label: "Resolved",
          onPressed: onResolvedPressed,
          backgroundColor: Colors.blue,
          borderRadius: 20.0,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          fontSize: 16,
        ),
      ],
    );
  }
}
