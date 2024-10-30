// lib/views/widgets/rounded_corner_container.dart
import 'package:flutter/material.dart';

class RoundedCornerContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const RoundedCornerContainer({
    Key? key,
    required this.child,
    this.borderRadius = 30.0, // Default radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}
