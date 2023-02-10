import 'package:currency_charts/features/chartrates/ui/footer/chart_range_selector.dart';
import 'package:currency_charts/features/chartrates/ui/footer/chart_range_timestamp.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:flutter/material.dart';

Widget chartFooter(
    {required int selectedIndex,
    required DateInterval interval,
    required Function(DateInterval) onSelected}) {
  return SpacedColumn(spacing: Dimens.defaultPadding, elements: [
    chartRangeTimestamp(interval),
    chartRangeSelector(selectedIndex: selectedIndex, onSelected: onSelected)
  ]);
}
