// lib/views/widgets/custom_rounded_button.dart

import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double diameter; // Diameter for the circular button
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const CustomRoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.diameter = 60.0, // Default diameter for the button
    this.backgroundColor = Colors.tealAccent,
    this.textColor = Colors.white,
    this.fontSize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle, // Makes the container circular
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4), // Increased opacity for darker shadow
              blurRadius: 16, // Larger blur radius for a softer, larger shadow
              spreadRadius: 4, // Increased spread for a wider shadow effect
              offset: const Offset(0, 6), // Slightly deeper shadow offset
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
