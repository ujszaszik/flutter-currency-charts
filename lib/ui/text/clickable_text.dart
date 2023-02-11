import 'package:flutter/material.dart';

Widget clickableText({required String text, required Function onClick}) {
  return GestureDetector(
    onTap: () {
      onClick();
    },
    child: Text(text),
  );
}
