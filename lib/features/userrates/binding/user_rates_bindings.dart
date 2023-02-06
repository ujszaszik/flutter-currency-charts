import 'package:currency_charts/features/userrates/controller/user_rates_controller.dart';
import 'package:currency_charts/features/userrates/parser/user_rates_xml_parser.dart';
import 'package:currency_charts/features/userrates/repository/user_rates_repository.dart';
import 'package:currency_charts/features/userrates/service/user_rates_service.dart';
import 'package:get/get.dart';

class UserRatesBindings extends Bindings {
  @override
  void dependencies() {
    // Service
    Get.lazyPut<IUserRatesService>(() => UserRatesService());

    // Parser
    Get.lazyPut(() => UserRatesXmlParser());

    // Repository
    Get.lazyPut<IUserRatesRepository>(() => UserRatesRepository(
        service: Get.find<IUserRatesService>(),
        parser: Get.find<UserRatesXmlParser>()));

    // Controller
    Get.lazyPut(
        () => UserRatesController(repository: Get.find<IUserRatesRepository>()));
  }
}
