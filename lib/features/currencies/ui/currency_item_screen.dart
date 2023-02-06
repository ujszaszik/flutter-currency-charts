import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:flutter/material.dart';

Widget currencyItemScreen(
    {required CurrencyType currency, required Function(CurrencyType) onClick}) {
  return GestureDetector(
      onTap: () => onClick(currency),
      child: Padding(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageAsset(
                  name: currency.imageName(),
                  size: Sizes.currencyItemImageSize),
              horizontalSpacer(),
              Text(currency.name, style: const TextStyle(fontSize: 16))
            ],
          )));
}
