import 'package:flutter/material.dart';

class Colorings {
  static const chartGradientStart = Color(0xFF2196F3);
  static const chartGradientEnd = Color(0xFF50E4FF);

  static Color chartTween =
      ColorTween(begin: chartGradientStart, end: chartGradientEnd)
          .lerp(0.2)!
          .withOpacity(1.0);

  static Color chartTweenOpaque =
      ColorTween(begin: chartGradientStart, end: chartGradientEnd)
          .lerp(0.2)!
          .withOpacity(0.1);
}
