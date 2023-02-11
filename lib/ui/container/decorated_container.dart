import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Widget decoratedContainer({required Widget child, Color color = Colors.white}) {
  return DecoratedBox(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimens.containerRadius),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.blueGrey, blurRadius: Dimens.containerRadius)
          ]),
      child: Padding(
          padding: const EdgeInsets.only(
              left: Dimens.halfPadding, right: Dimens.halfPadding),
          child: child));
}
