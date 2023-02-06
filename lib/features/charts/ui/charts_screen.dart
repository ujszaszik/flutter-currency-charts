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
        builder: (controller) => const Text('CHARTS WILL BE HERE'));
  }
}
