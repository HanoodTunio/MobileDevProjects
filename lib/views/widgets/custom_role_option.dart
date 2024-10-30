import 'package:flutter/material.dart';

class CustomRoleOption extends StatelessWidget {
  final String role;
  final String assetPath;
  final VoidCallback onTap;

  const CustomRoleOption({
    Key? key,
    required this.role,
    required this.assetPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(assetPath),
          ),
          const SizedBox(width: 20),
          Text(
            role,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
