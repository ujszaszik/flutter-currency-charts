import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_row.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:flutter/material.dart';

Widget chartRangeSelector(
    {required int selectedIndex, required Function(DateInterval) onSelected}) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: SpacedRow(
          spacing: Dimens.defaultPadding,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          elements: _generateButtons(selectedIndex, onSelected)));
}

List<ElevatedButton> _generateButtons(
    int selectedIndex, Function(DateInterval) onSelected) {
  return DateInterval.values
      .map((interval) => ElevatedButton(
          style: ButtonStyle(
            shape: _getShape(interval, selectedIndex),
            backgroundColor: _getStateColor(interval, selectedIndex),
          ),
          onPressed: () => onSelected(interval),
          child: Text(interval.text())))
      .toList();
}

MaterialStateProperty<RoundedRectangleBorder> _getShape(
    DateInterval interval, int selectedIndex) {
  return MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)));
}

MaterialStateProperty<Color> _getStateColor(
    DateInterval interval, int selectedIndex) {
  return MaterialStateProperty.all(_getButtonColor(interval, selectedIndex));
}

Color _getButtonColor(DateInterval interval, int selectedIndex) {
  if (interval.index == selectedIndex) {
    return Colors.blueGrey;
  } else {
    return Colors.blueGrey.shade200;
  }
}
