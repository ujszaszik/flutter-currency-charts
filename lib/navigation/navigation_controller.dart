import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:currency_charts/features/bankrates/ui/bank_rates_screen.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/ui/chart_rates_screen.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:currency_charts/features/currencyrates/ui/currency_rates_screen.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/features/userrates/ui/user_rates_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  void showUserRatesFor(UserRatesQuery query) {
    Get.toNamed(UserRatesScreen.route,
        arguments: {UserRatesQuery.argsKey: query});
  }

  void showBankRatesFor(BankRatesQuery query) {
    Get.toNamed(BankRatesScreen.route,
        arguments: {BankRatesQuery.argsKey: query});
  }

  void showCurrencyRatesFor(CurrencyRatesQuery query) {
    Get.toNamed(CurrencyRatesScreen.route,
        arguments: {CurrencyRatesQuery.argsKey: query});
  }

  void showChartRatesFor(ChartRatesQuery query) {
    Get.toNamed(ChartRatesScreen.route,
        arguments: {ChartRatesQuery.argsKey: query});
  }
}
