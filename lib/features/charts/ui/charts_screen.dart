import 'package:currency_charts/features/chartrates/ui/chart_rates_screen.dart';
import 'package:currency_charts/features/charts/controller/charts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartsScreen extends GetView<ChartsController> {
  const ChartsScreen({super.key});

  static const route = "/charts";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartsController>(
        init: ChartsController(),
        builder: (controller) => Center(
            child: ElevatedButton(
                onPressed: _navigate, child: const Text('CLICK'))));
  }

  _navigate() {
    Get.toNamed(ChartRatesScreen.route);
  }
}
