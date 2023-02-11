import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/container/decorated_container.dart';
import 'package:flutter/material.dart';

Widget primaryButton(
    {required String label,
    required Function onPressed,
    double topMargin = 0}) {
  return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: GestureDetector(
          onTap: () {
            onPressed();
          },
          child: decoratedContainer(
              color: Colors.blueGrey,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.defaultPadding),
                  height: Sizes.buttonSize.height,
                  width: Sizes.buttonSize.width,
                  color: Colors.blueGrey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(label,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: Dimens.textSizeM)),
                      ])))));
}
