import 'package:currency_charts/features/rates/controller/rates_controller.dart';
import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/features/rates/ui/rates_table.dart';
import 'package:currency_charts/features/rates/ui/rates_header.dart';
import 'package:currency_charts/model/currency/currency_model.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatesScreen extends GetView<RatesController> {
  const RatesScreen({Key? key}) : super(key: key);

  static const route = '/rates';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatesController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text(Strings.ratesQueryTitle)),
          body: Center(
              child: ResourceAwareScreen(
            stream: controller.getRatesFor(getQuery()),
            mainScreen: (data) => _ratesContent(getQuery(), data),
          ))),
    );
  }

  Widget _ratesContent(RatesQuery query, CurrencyModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ratesHeader(getQuery()), ratesTable(model)],
    );
  }

  RatesQuery getQuery() {
    return Get.arguments[RatesQuery.argsKey];
  }
}
