import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Text largeText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: Dimens.textSizeL),
  );
}

Text largeBoldText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: Dimens.textSizeL, fontWeight: FontWeight.bold),
  );
}

Text largeItalicText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: Dimens.textSizeL, fontStyle: FontStyle.italic),
  );
}
