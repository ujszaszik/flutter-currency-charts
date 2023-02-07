import 'package:currency_charts/features/chartrates/controller/chart_rates_controller.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartRatesScreen extends GetView<ChartRatesController> {
  const ChartRatesScreen({super.key});

  static const route = "/chartRates";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartRatesController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(title: const Text(Strings.chartRatesQueryTitle)),
              body: ResourceAwareScreen(
                  stream: controller.getChartItems(),
                  mainScreen: (data) => Text(data.toString())),
            ));
  }
}
