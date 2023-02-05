import 'package:currency_charts/features/bankrates/controller/bankrates_controller.dart';
import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:currency_charts/features/bankrates/model/banks_currencies_list.dart';
import 'package:currency_charts/resources/Strings.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:currency_charts/ui/table/rates_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankRatesScreen extends GetView<BankRatesController> {
  const BankRatesScreen({Key? key}) : super(key: key);

  static const route = '/bankRates';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankRatesController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(title: const Text(Strings.bankRatesQueryTitle)),
            body: ResourceAwareScreen(
                stream: controller.getRatesFor(_getBankArgument().bank),
                mainScreen: (data) => _bankRatesTable(data))));
  }

  Widget _bankRatesTable(BanksCurrenciesList list) {
    return ListView.builder(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        itemCount: list.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ratesTable(list.items[index]);
        });
  }

  BankRatesQuery _getBankArgument() {
    return Get.arguments[BankRatesQuery.argsKey];
  }
}
