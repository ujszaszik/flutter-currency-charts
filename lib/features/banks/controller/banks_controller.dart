import 'package:currency_charts/data/model/bank.dart';
import 'package:get/get.dart';

class BanksController extends GetxController {
  final banks = <Bank>[].obs;

  BanksController() {
    banks(Bank.values);
    update();
  }
}
