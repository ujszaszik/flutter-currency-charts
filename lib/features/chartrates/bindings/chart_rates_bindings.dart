import 'package:currency_charts/features/chartrates/controller/chart_rates_controller.dart';
import 'package:currency_charts/features/chartrates/parser/chart_rates_parser.dart';
import 'package:currency_charts/features/chartrates/repository/chart_rates_repository.dart';
import 'package:currency_charts/features/chartrates/service/chart_rates_service.dart';
import 'package:get/get.dart';

class ChartRatesBindings extends Bindings {
  @override
  void dependencies() {
    // Service
    Get.lazyPut<IChartRatesService>(() => ChartRatesService());
    // Parser
    Get.lazyPut(() => ChartRatesParser());
    // Repository
    Get.lazyPut<IChartRatesRepository>(() => ChartRatesRepository(
        service: Get.find<IChartRatesService>(),
        parser: Get.find<ChartRatesParser>()));
    // Controller
    Get.lazyPut(() =>
        ChartRatesController(repository: Get.find<IChartRatesRepository>()));
  }
}
