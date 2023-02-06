import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:flutter/material.dart';

Widget bankItemScreen({required Bank bank, required Function(Bank) onClick}) {
  return GestureDetector(
      onTap: () => {onClick(bank)},
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageAsset(name: bank.imageName(), size: Sizes.bankImageSize)
            ]),
      )));
}
