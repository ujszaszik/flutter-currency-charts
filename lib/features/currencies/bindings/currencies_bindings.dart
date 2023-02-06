import 'package:currency_charts/features/currencies/controller/currencies_controller.dart';
import 'package:get/get.dart';

class CurrenciesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurrenciesController());
  }
}
