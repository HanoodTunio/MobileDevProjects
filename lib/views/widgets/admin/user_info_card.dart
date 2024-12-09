import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String country;
  final String role;

  const UserInfoCard({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            const CircleAvatar(
              radius: 30,
              child: Icon(Icons.person, size: 30, color: Colors.white),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(width: 16.0),
            // User details and flag
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      // Display Pakistani flag
                      Image.asset(
                        'assets/flag.jpg', // Update path to your image
                        height: 16,
                        width: 16, // Set both width and height to 16 for icon size
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.flag, size: 16); // Placeholder if image fails
                        },
                      ),
                      const SizedBox(width: 4),
                      Text(role, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(email, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            // Phone number with alignment on the right
            Flexible(
              child: Text(
                phone,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end, // Align text to the right
              ),
            ),
          ],
        ),
      ),
    );
  }
}
