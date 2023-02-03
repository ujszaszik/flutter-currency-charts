import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;

  void updateSelectionIndex(int newValue) {
    if (newValue != selectedIndex.value) {
      selectedIndex(newValue);
      update();
    }
  }
}
