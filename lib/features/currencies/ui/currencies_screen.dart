import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/currencies/controller/currencies_controller.dart';
import 'package:currency_charts/features/currencies/ui/currency_item_screen.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrenciesScreen extends GetView<CurrenciesController> {
  const CurrenciesScreen({Key? key}) : super(key: key);

  static const route = '/currencies';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrenciesController>(
      init: CurrenciesController(),
      builder: (controller) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 100),
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        itemCount: controller.currenciesCount,
        itemBuilder: (BuildContext context, int index) {
          return currencyItemScreen(
              currency: controller.getCurrencies()[index],
              onClick: (currency) => _navigateToCurrencyRates(currency));
        },
      ),
    );
  }

  _navigateToCurrencyRates(CurrencyType currency) {
    final query = CurrencyRatesQuery(type: currency);
    Get.find<NavigationController>().showCurrencyRatesFor(query);
  }
}
