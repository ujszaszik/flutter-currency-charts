import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/currencyrates/controller/currency_rates_controller.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_item.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/image/image_header.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:currency_charts/ui/table/rates_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyRatesScreen extends GetView<CurrencyRatesController> {
  const CurrencyRatesScreen({super.key});

  static String route = '/currencyRates';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrencyRatesController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text(Strings.currencyRatesQueryTitle)),
          body: ResourceAwareScreen(
              stream: controller.getCurrencyRatesFor(_getQuery()),
              mainScreen: (data) => _currencyRatesContent(data))),
    );
  }

  Widget _currencyRatesContent(CurrencyRatesModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        imageHeader(
            imageName: _getQuery().type.imageName(),
            imageTitle: _getQuery().type.name),
        _currencyRatesTable(model)
      ],
    );
  }

  Widget _currencyRatesTable(CurrencyRatesModel model) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(Dimens.defaultPadding),
            itemCount: model.length,
            itemBuilder: (BuildContext context, int index) {
              return ratesTable(model[index]);
            }));
  }

  CurrencyRatesQuery _getQuery() {
    return Get.arguments[CurrencyRatesQuery.argsKey];
  }
}
