import 'package:currency_charts/data/repository/currency_repository.dart';
import 'package:currency_charts/features/rates/controller/rates_controller.dart';
import 'package:get/get.dart';

class RatesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => RatesController(repository: Get.find<ICurrencyRepository>()));
  }
}
