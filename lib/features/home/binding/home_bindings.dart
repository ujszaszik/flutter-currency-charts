import 'package:currency_charts/features/home/controller/home_controller.dart';
import 'package:currency_charts/navigation/navigation_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
