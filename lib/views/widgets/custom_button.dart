import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? fontSize; // Optional fontSize parameter

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1A76D2),
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
    this.fontSize, // Allow fontSize to be passed optionally
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 18, // Use fontSize if provided, otherwise default to 18
          color: Colors.white,
        ),
      ),
    );
  }
}
