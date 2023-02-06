import 'package:currency_charts/features/bankrates/bindings/bankrates_bindings.dart';
import 'package:currency_charts/features/bankrates/ui/bank_rates_screen.dart';
import 'package:currency_charts/features/banks/bindings/banks_bindings.dart';
import 'package:currency_charts/features/banks/ui/banks_screen.dart';
import 'package:currency_charts/features/charts/bindings/charts_bindings.dart';
import 'package:currency_charts/features/charts/ui/charts_screen.dart';
import 'package:currency_charts/features/currencies/bindings/currencies_bindings.dart';
import 'package:currency_charts/features/currencies/ui/currencies_screen.dart';
import 'package:currency_charts/features/currencyrates/bindings/currency_rates_bindings.dart';
import 'package:currency_charts/features/currencyrates/ui/currency_rates_screen.dart';
import 'package:currency_charts/features/home/binding/home_bindings.dart';
import 'package:currency_charts/features/home/ui/home_screen.dart';
import 'package:currency_charts/features/main/binding/main_bindings.dart';
import 'package:currency_charts/features/main/ui/main_screen.dart';
import 'package:currency_charts/features/userrates/binding/user_rates_bindings.dart';
import 'package:currency_charts/features/userrates/ui/user_rates_screen.dart';
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
          name: UserRatesScreen.route,
          page: () => const UserRatesScreen(),
          binding: UserRatesBindings()),
      GetPage(
          name: CurrenciesScreen.route,
          page: () => const CurrenciesScreen(),
          binding: CurrenciesBindings()),
      GetPage(
          name: CurrencyRatesScreen.route,
          page: () => const CurrencyRatesScreen(),
          binding: CurrencyRatesBindings()),
      GetPage(
          name: BanksScreen.route,
          page: () => const BanksScreen(),
          binding: BanksBindings()),
      GetPage(
          name: BankRatesScreen.route,
          page: () => const BankRatesScreen(),
          binding: BankRatesBindings()),
      GetPage(
          name: ChartsScreen.route,
          page: () => const ChartsScreen(),
          binding: ChartsBindings())
    ];
  }
}
