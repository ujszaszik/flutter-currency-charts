import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/features/chartrates/ui/chart/chart_view.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget chartContent(ChartsItems data) {
  return SizedBox(
      height: Dimens.chartHeight,
      width: Dimens.chartWidth,
      child: LineChart(chartView(data)));
}
