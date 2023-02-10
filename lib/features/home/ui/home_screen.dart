import 'package:currency_charts/features/home/controller/home_controller.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/button/primary_button.dart';
import 'package:currency_charts/ui/dropdown/dropdown_generic.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) => Center(
                child: Padding(
              padding: const EdgeInsets.all(Dimens.doublePadding),
              child: SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: Dimens.doublePadding,
                elements: [
                  currencySelector(controller),
                  bankSelector(controller),
                  conversionsButton(controller)
                ],
              ),
            )));
  }

  Widget currencySelector(HomeController controller) {
    return genericDropdown(
      title: Strings.currencySelectionTitle,
      currentSelection: controller.currencySelection.value,
      menuItems: controller.getCurrencyMenuItems(),
      onChanged: (newValue) => controller.updateCurrencySelection(newValue),
    );
  }

  Widget bankSelector(HomeController controller) {
    return genericDropdown(
      title: Strings.bankSelectionTitle,
      currentSelection: controller.bankSelection.value,
      menuItems: controller.getBankMenuItems(),
      onChanged: (newValue) => controller.updateBankSelection(newValue),
    );
  }

  Widget conversionsButton(HomeController controller) {
    return primaryButton(
        onPressed: () => _navigateToRates(controller.buildRatesQuery()),
        label: Strings.labelShowCurrencyConverts,
        topMargin: Dimens.largePadding);
  }

  void _navigateToRates(UserRatesQuery query) {
    Get.find<NavigationController>().showRatesFor(query);
  }
}
