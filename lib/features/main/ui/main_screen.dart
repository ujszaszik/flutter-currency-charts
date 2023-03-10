import 'package:currency_charts/features/banks/ui/banks_screen.dart';
import 'package:currency_charts/features/charts/ui/charts_screen.dart';
import 'package:currency_charts/features/currencies/ui/currencies_screen.dart';
import 'package:currency_charts/features/home/ui/home_screen.dart';
import 'package:currency_charts/features/main/controller/main_controller.dart';
import 'package:currency_charts/navigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => Scaffold(
            appBar: AppBar(title: Text(_actualScreenTitle())),
            body: IndexedStack(
              index: controller.selectedIndex.value,
              children: const [
                HomeScreen(),
                CurrenciesScreen(),
                BanksScreen(),
                ChartsScreen()
              ],
            ),
            bottomNavigationBar: bottomNavigationBar(
                (selection) => controller.updateSelectionIndex(selection),
                controller.selectedIndex.value)));
  }

  String _actualScreenTitle() {
    return navBarItems()[controller.selectedIndex.value].label ?? '';
  }
}
