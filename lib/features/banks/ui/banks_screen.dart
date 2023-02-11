import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:currency_charts/features/banks/controller/banks_controller.dart';
import 'package:currency_charts/features/banks/ui/bank_item_screen.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BanksScreen extends GetView<BanksController> {
  const BanksScreen({Key? key}) : super(key: key);

  static const route = '/banks';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BanksController>(
        init: BanksController(), builder: (controller) => _banksContent());
  }

  GridView _banksContent() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Dimens.gridCellSize,
          mainAxisExtent: Dimens.gridCellHeight),
      itemCount: controller.banks.length,
      itemBuilder: (BuildContext context, int index) {
        return bankItemScreen(
          bank: controller.banks[index],
          onClick: (bank) => _navigateToBankRates(bank),
        );
      },
    );
  }

  _navigateToBankRates(Bank bank) {
    Get.find<NavigationController>()
        .showBankRatesFor(BankRatesQuery(bank: bank));
  }
}
