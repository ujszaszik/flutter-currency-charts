import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/charts/controller/charts_controller.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/button/primary_button.dart';
import 'package:currency_charts/ui/dropdown/dropdown_generic.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
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
                child: Padding(
              padding: const EdgeInsets.all(Dimens.doublePadding),
              child: SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Dimens.doublePadding,
                elements: [
                  currencySelector(controller),
                  conversionsButton(controller)
                ],
              ),
            )));
  }

  Widget currencySelector(ChartsController controller) {
    return genericDropdown(
      title: Strings.currencySelectionTitle,
      currentSelection: controller.currencySelection.value,
      menuItems: controller.getCurrencyMenuItems(),
      onChanged: (newValue) => controller.updateCurrencySelection(newValue),
    );
  }

  Widget conversionsButton(ChartsController controller) {
    return primaryButton(
        onPressed: () => _navigateToChart(controller.buildQuery()),
        label: Strings.labelShowChartRates,
        topMargin: Dimens.largePadding);
  }

  _navigateToChart(ChartRatesQuery query) {
    Get.find<NavigationController>().showChartRatesFor(query);
  }
}
