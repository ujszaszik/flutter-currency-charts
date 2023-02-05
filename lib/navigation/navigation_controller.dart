import 'package:currency_charts/features/bankrates/ui/bank_rates_screen.dart';
import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/features/userrates/ui/rates_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  void showRatesFor(UserRatesQuery query) {
    Get.toNamed(RatesScreen.route, arguments: {UserRatesQuery.argsKey: query});
  }

  void showBankRatesFor(BankRatesQuery query) {
    Get.toNamed(BankRatesScreen.route, arguments: {BankRatesQuery.argsKey: query});
  }
}
