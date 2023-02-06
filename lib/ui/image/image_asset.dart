import 'package:currency_charts/resources/sizes.dart';
import 'package:flutter/material.dart';

Widget imageAsset({required String name, required SizeArea size}) {
  return Image.asset(name, width: size.width, height: size.height);
}
