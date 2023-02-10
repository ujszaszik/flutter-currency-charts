import 'package:currency_charts/extension/numeric_extensions.dart';
import 'package:currency_charts/features/chartrates/model/chart_data_extensions.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/spacing/spaced_row.dart';
import 'package:flutter/material.dart';

Widget chartHeaderExtremes(ChartsItems data) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: SpacedRow(
          spacing: Dimens.defaultPadding,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          elements: [
            _extremeValuesCard(Strings.minimumValue, data.min()),
            _extremeValuesCard(Strings.maximumValue, data.max()),
            _extremeValuesCard(Strings.averageValue, data.avg()),
            _extremeValuesCard(Strings.medianValue, data.median()),
          ]));
}

Card _extremeValuesCard(String key, double value) {
  return Card(
    elevation: Dimens.defaultCardElevation,
    child: Column(children: [
      Container(
          color: Colors.blueGrey,
          width: Dimens.chartExtremeWidth,
          child: keyText(key)),
      Container(color: Colors.white, child: valueText(value))
    ]),
  );
}

Widget keyText(String key) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Text(
        key,
        style:
            const TextStyle(fontSize: Dimens.textSizeXS, color: Colors.white),
        textAlign: TextAlign.center,
      ));
}

Widget valueText(double value) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Text(value.formatted(),
          style: const TextStyle(
              fontSize: Dimens.textSizeS, color: Colors.blueGrey)));
}
