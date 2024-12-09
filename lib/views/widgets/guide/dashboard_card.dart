// lib/widgets/guide/dashboard_card.dart

import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final String content;
  final Widget? child;

  const DashboardCard({
    Key? key,
    required this.title,
    this.icon = Icons.info,       // Default icon
    this.iconSize = 50.0,         // Default icon size
    this.content = '',            // Default empty content
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A76D2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Icon(icon, size: iconSize, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                color: Color(0xFF1A76D2),
                fontSize: 14,
              ),
            ),
            if (child != null) child!, // Render additional child widget if provided
          ],
        ),
      ),
    );
  }
}
