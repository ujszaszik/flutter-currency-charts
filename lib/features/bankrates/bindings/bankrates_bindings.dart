import 'package:currency_charts/features/bankrates/controller/bankrates_controller.dart';
import 'package:currency_charts/features/bankrates/parser/bank_rates_xml_parser.dart';
import 'package:currency_charts/features/bankrates/repository/bank_rates_repository.dart';
import 'package:currency_charts/features/bankrates/service/bank_rates_service.dart';
import 'package:get/get.dart';

class BankRatesBindings extends Bindings {
  @override
  void dependencies() {
    // Service
    Get.lazyPut<IBankRatesService>(() => BankRatesService());

    // Parser
    Get.lazyPut(() => BankRatesXmlParser());

    // Repository
    Get.lazyPut<IBankRatesRepository>(() => BankRatesRepository(
        service: Get.find<IBankRatesService>(),
        parser: Get.find<BankRatesXmlParser>()));

    // Controller
    Get.lazyPut(() =>
        BankRatesController(repository: Get.find<IBankRatesRepository>()));
  }
}
