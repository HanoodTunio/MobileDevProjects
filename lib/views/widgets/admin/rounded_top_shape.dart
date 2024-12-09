// lib/views/widgets/rounded_top_shape.dart

import 'package:flutter/material.dart';

class RoundedTopShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, rect.height)
      ..lineTo(0, 80) // Start rounding higher for more roundness
      ..quadraticBezierTo(0, 0, 80, 0) // Control point increased for more curve
      ..lineTo(rect.width - 80, 0)
      ..quadraticBezierTo(rect.width, 0, rect.width, 80) // Matching curve on the other side
      ..lineTo(rect.width, rect.height)
      ..lineTo(0, rect.height)
      ..close();
  }
}
