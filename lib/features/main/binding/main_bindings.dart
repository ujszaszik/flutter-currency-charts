import 'package:currency_charts/features/main/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}