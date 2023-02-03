import 'package:currency_charts/data/bindings/data_bindings.dart';
import 'package:currency_charts/features/home/binding/home_bindings.dart';
import 'package:currency_charts/features/home/ui/home_screen.dart';
import 'package:currency_charts/features/main/binding/main_bindings.dart';
import 'package:currency_charts/features/main/ui/main_screen.dart';
import 'package:currency_charts/features/rates/binding/rates_bindings.dart';
import 'package:currency_charts/features/rates/ui/rates_screen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> all() {
    return [
      GetPage(
          name: MainScreen.route,
          page: () => const MainScreen(),
          binding: MainBindings()),
      GetPage(
          name: HomeScreen.route,
          page: () => const HomeScreen(),
          binding: HomeBindings()),
      GetPage(
          name: RatesScreen.route,
          page: () => const RatesScreen(),
          bindings: [RatesBindings(), DataBindings()])
    ];
  }
}
