import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Widget sectionContainer(
    {required Widget left, required Widget right, required double height}) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(height: height, child: left),
            flex: 1,
          ),
          Expanded(
            child: SizedBox(height: height, child: right),
            flex: 1,
          )
        ],
      ));
}
