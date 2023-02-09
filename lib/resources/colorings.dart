import 'package:flutter/material.dart';

class Colorings {
  static const chartGradientStart = Colors.blueGrey;
  static const chartGradientEnd = Colors.blueGrey;

  static Color chartTween =
      ColorTween(begin: chartGradientStart, end: chartGradientEnd)
          .lerp(0.2)!
          .withOpacity(1.0);

  static Color chartTweenOpaque =
      ColorTween(begin: chartGradientStart, end: chartGradientEnd)
          .lerp(0.2)!
          .withOpacity(0.1);
}
