import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:flutter/material.dart';

Widget chartCurrencyHeader(ChartsItems items) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.halfPadding),
      child: SpacedColumn(
        spacing: Dimens.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.end,
        elements: [
          Text(
            items.currencyType.name,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
          ),
          Image.asset(items.currencyType.imageName(), height: 50, width: 50)
        ],
      ));
}
