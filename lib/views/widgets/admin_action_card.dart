// lib/views/widgets/admin_action_card.dart

import 'package:flutter/material.dart';
import 'custom_rouded_button.dart';

class AdminActionCard extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onPressed;

  const AdminActionCard({
    Key? key,
    required this.title,
    required this.count,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),

          // Wrap CircleAvatar in a Container with BoxShadow
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Increased shadow opacity
                  blurRadius: 10, // Larger blur radius for a more pronounced shadow
                  spreadRadius: 2, // Increased spread for a wider shadow effect
                  offset: const Offset(0, 6), // Adjusted offset for more depth
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.tealAccent,
              child: Icon(Icons.circle, color: Colors.white, size: 12),
            ),
          ),

          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CustomRoundedButton(
              label: '+$count',
              onPressed: onPressed,
              diameter: 60, // Set the diameter of the button
              backgroundColor: const Color(0xFF327CDD),
              textColor: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
