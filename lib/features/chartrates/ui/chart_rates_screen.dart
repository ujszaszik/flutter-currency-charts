import 'package:currency_charts/features/chartrates/controller/chart_rates_controller.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/ui/chart_range_selector.dart';
import 'package:currency_charts/features/chartrates/ui/chart_view.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartRatesScreen extends GetView<ChartRatesController> {
  const ChartRatesScreen({super.key});

  static const route = "/chartRates";

  @override
  Widget build(BuildContext context) {
    _loadInitialValues();
    return GetBuilder<ChartRatesController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(title: const Text(Strings.chartRatesQueryTitle)),
            body: ResourceAwareScreen(
              stream: controller.chartItems.value,
              mainScreen: (data) => Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    chartHeader(data),
                    SizedBox(
                        height: 300,
                        width: 360,
                        child: LineChart(chartView(data))),
                    chartRangeSelector(
                        selectedIndex: controller.selectedIndex.value,
                        onSelected: (interval) =>
                            controller.updateItems(interval))
                  ])),
            )));
  }

  _loadInitialValues() {
    Get.find<ChartRatesController>().getChartItems(_getQuery());
  }

  ChartRatesQuery _getQuery() {
    return Get.arguments[ChartRatesQuery.argsKey];
  }
}
