import 'package:currency_charts/features/currencyrates/controller/currency_rates_controller.dart';
import 'package:currency_charts/features/currencyrates/parser/currency_rates_parser.dart';
import 'package:currency_charts/features/currencyrates/repository/currency_rates_repository.dart';
import 'package:currency_charts/features/currencyrates/service/currency_rates_service.dart';
import 'package:get/get.dart';

class CurrencyRatesBindings extends Bindings {
  @override
  void dependencies() {
    // Parser
    Get.lazyPut(() => CurrencyRatesParser());

    // Service
    Get.lazyPut<ICurrencyRatesService>(() => CurrencyRatesService());

    // Repository
    Get.lazyPut<ICurrencyRatesRepository>(() => CurrencyRatesRepository(
        service: Get.find<ICurrencyRatesService>(),
        parser: Get.find<CurrencyRatesParser>()));

    // Controller
    Get.lazyPut(() => CurrencyRatesController(
        repository: Get.find<ICurrencyRatesRepository>()));
  }
}
