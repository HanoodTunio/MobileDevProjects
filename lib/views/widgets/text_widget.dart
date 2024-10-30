// lib/views/widgets/text_widget.dart
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextWidget({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontSize = 16.0, // Default font size
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
