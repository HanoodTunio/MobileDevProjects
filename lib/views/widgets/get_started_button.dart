// lib/views/widgets/get_started_button.dart
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const GetStartedButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(1000),
          topRight: Radius.circular(1000),
        ),
        child: Container(
          width: 351,
          height: 170,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF164C94),
                Color(0xFF4A90E2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 20,
                blurRadius: 30,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
