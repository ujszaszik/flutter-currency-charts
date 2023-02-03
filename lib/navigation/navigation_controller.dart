import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/features/rates/ui/rates_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  void showRatesFor(RatesQuery query) {
    Get.toNamed(RatesScreen.route, arguments: {RatesQuery.argsKey: query});
  }
}
