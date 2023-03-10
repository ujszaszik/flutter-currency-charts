import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:flutter/material.dart';

Widget userRatesHeader(UserRatesQuery query) {
  return SpacedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.defaultPadding,
      elements: [
        verticalSpacer(),
        imageAsset(name: query.bank.imageName(), size: Sizes.bankImageSize)
      ]);
}
