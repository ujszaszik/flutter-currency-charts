import 'package:currency_charts/features/chartrates/controller/chart_rates_controller.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/ui/chart/chart_content.dart';
import 'package:currency_charts/features/chartrates/ui/footer/chart_footer.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
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
                    _header(data),
                    chartContent(data),
                    _footer()
                  ])),
            )));
  }

  _loadInitialValues() {
    Get.find<ChartRatesController>().getChartItems(_getQuery());
  }

  Widget _header(ChartsItems data) {
    return chartHeader(data: data, interval: controller.selectedInterval.value);
  }

  Widget _footer() {
    return chartFooter(
        selectedIndex: controller.selectedInterval.value.index,
        interval: controller.selectedInterval.value,
        onSelected: (interval) => controller.updateItems(interval));
  }

  ChartRatesQuery _getQuery() {
    return Get.arguments[ChartRatesQuery.argsKey];
  }
}
