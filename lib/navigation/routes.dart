import 'package:currency_charts/features/bankrates/bindings/bankrates_bindings.dart';
import 'package:currency_charts/features/bankrates/ui/bank_rates_screen.dart';
import 'package:currency_charts/features/banks/bindings/banks_bindings.dart';
import 'package:currency_charts/features/banks/ui/banks_screen.dart';
import 'package:currency_charts/features/home/binding/home_bindings.dart';
import 'package:currency_charts/features/home/ui/home_screen.dart';
import 'package:currency_charts/features/main/binding/main_bindings.dart';
import 'package:currency_charts/features/main/ui/main_screen.dart';
import 'package:currency_charts/features/userrates/binding/user_rates_bindings.dart';
import 'package:currency_charts/features/userrates/ui/rates_screen.dart';
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
          binding: UserRatesBindings()),
      GetPage(
          name: BanksScreen.route,
          page: () => const BanksScreen(),
          binding: BanksBindings()),
      GetPage(
          name: BankRatesScreen.route,
          page: () => const BankRatesScreen(),
          binding: BankRatesBindings())
    ];
  }
}
