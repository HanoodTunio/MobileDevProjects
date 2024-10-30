// lib/views/widgets/rounded_image.dart
import 'package:flutter/material.dart';
import 'rounded_corner_container.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final double borderRadius;

  const RoundedImage({
    Key? key,
    required this.imagePath,
    this.width = 100.0, // Default width
    this.height = 100.0, // Default height
    this.borderRadius = 30.0, // Default radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedCornerContainer(
      borderRadius: borderRadius,
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
