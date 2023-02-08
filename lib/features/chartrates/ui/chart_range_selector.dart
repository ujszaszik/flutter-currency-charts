import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_row.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:flutter/material.dart';

Widget chartRangeSelector(Function(DateInterval) onSelected) {
  return SpacedRow(
      spacing: Dimens.defaultPadding,
      mainAxisAlignment: MainAxisAlignment.center,
      elements: _generateButtons(onSelected));
}

List<ElevatedButton> _generateButtons(Function(DateInterval) onSelected) {
  return DateInterval.values
      .map((interval) => ElevatedButton(
          onPressed: () => onSelected(interval), child: Text(interval.text())))
      .toList();
}
