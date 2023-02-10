import 'package:currency_charts/extension/numeric_extensions.dart';
import 'package:currency_charts/features/chartrates/model/chart_data_extensions.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spaced_row.dart';
import 'package:currency_charts/util/numeric/based_on_sign.dart';
import 'package:flutter/material.dart';

Widget chartHeaderRates(ChartsItems items) {
  return SpacedColumn(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: Dimens.doublePadding,
    elements: [
      Text(
        items.current().formatted(),
        style: const TextStyle(
            fontSize: Dimens.textSizeTitle, color: Colors.blueGrey),
      ),
      SpacedRow(
        spacing: Dimens.doublePadding,
        elements: [
          _differenceText(items.difference()),
          _differencePercentWithIcon(items.differencePercent())
        ],
      )
    ],
  );
}

Text _differenceText(double value) {
  return Text(_differenceValue(value),
      style:
          const TextStyle(fontSize: Dimens.textSizeXL, color: Colors.blueGrey));
}

String _differenceValue(double value) {
  String text = BasedOnSign(onPositive: '+', onNegative: '-', onNeutral: '')
      .getFrom(value);
  text += value.abs().formatted();
  return text;
}

Widget _differencePercentWithIcon(double value) {
  return SpacedRow(
      spacing: Dimens.halfPadding,
      elements: [_differentPercentText(value), _differencePercentIcon(value)]);
}

Text _differentPercentText(double value) {
  return Text(
    value.formatted(),
    style: TextStyle(
        fontSize: Dimens.textSizeXL, color: _differencePercentColor(value)),
  );
}

Color _differencePercentColor(double value) {
  return BasedOnSign<MaterialColor>(
          onPositive: Colors.green, onNegative: Colors.red)
      .getFrom(value);
}

Icon _differencePercentIcon(double value) {
  return BasedOnSign<Icon>(
          onPositive: const Icon(Icons.arrow_upward, color: Colors.green),
          onNegative: const Icon(Icons.arrow_downward, color: Colors.red),
          onNeutral: const Icon(Icons.shape_line))
      .getFrom(value);
}
