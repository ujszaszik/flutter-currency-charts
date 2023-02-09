import 'package:currency_charts/extension/numeric_extensions.dart';
import 'package:currency_charts/features/chartrates/model/chart_data_extensions.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spaced_row.dart';
import 'package:flutter/material.dart';

Widget chartHeaderRates(ChartsItems items) {
  return SpacedColumn(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: Dimens.doublePadding,
    elements: [
      Text(
        items.current().formatted(),
        style: const TextStyle(fontSize: 36, color: Colors.blueGrey),
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
      style: const TextStyle(fontSize: 20, color: Colors.blueGrey));
}

String _differenceValue(double value) {
  String text = '';
  if (value < 0.0) {
    text += '-';
  } else if (value > 0.0) {
    text += '+';
  }
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
    style: TextStyle(fontSize: 20, color: _differencePercentColor(value)),
  );
}

Color _differencePercentColor(double value) {
  if (value >= 0.0) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

Icon _differencePercentIcon(double value) {
  if (value > 0.0) {
    return const Icon(Icons.arrow_upward, color: Colors.green);
  } else if (value < 0.0) {
    return const Icon(Icons.arrow_downward, color: Colors.red);
  } else {
    return const Icon(Icons.shape_line);
  }
}
