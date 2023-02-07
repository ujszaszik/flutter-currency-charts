import 'package:currency_charts/features/charts/controller/charts_controller.dart';
import 'package:get/get.dart';

class ChartsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartsController());
  }
}
