import 'package:collection/collection.dart';
import 'package:currency_charts/features/chartrates/model/chart_data_extensions.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';
import 'package:currency_charts/resources/colorings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData chartView(ChartsItems data) {
  return LineChartData(
    lineTouchData: LineTouchData(enabled: false),
    gridData: FlGridData(show: false, drawHorizontalLine: false),
    titlesData: _tilesData(),
    borderData: FlBorderData(show: false),
    minX: 0,
    maxX: data.size() - 1,
    minY: data.min() - _getOptimalRounding(data.min(), data.max()),
    maxY: data.max() + _getOptimalRounding(data.min(), data.max()),
    lineBarsData: [_chartBarData(data)],
  );
}

FlTitlesData _tilesData() {
  return FlTitlesData(
      show: true,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ));
}

LineChartBarData _chartBarData(List<ChartsData> data) {
  return LineChartBarData(
    spots: _chartSpots(data),
    isCurved: false,
    gradient: LinearGradient(
      colors: [Colorings.chartTween, Colorings.chartTween],
    ),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: [Colorings.chartTweenOpaque, Colorings.chartTweenOpaque],
      ),
    ),
  );
}

List<FlSpot> _chartSpots(List<ChartsData> data) {
  return data
      .mapIndexed((index, data) => FlSpot(index.toDouble(), data.value))
      .toList();
}

double _getOptimalRounding(double min, double max) {
  return (max - min) / 2;
}
