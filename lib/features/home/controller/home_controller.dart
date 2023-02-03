import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';
import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/model/bank.dart';
import 'package:currency_charts/model/currency_type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currencySelection = 0.obs;
  final bankSelection = 0.obs;

  updateCurrencySelection(int? newValue) {
    if (newValue != null && currencySelection.value != newValue) {
      currencySelection(newValue);
      update();
    }
  }

  updateBankSelection(int? newValue) {
    if (newValue != null && currencySelection.value != newValue) {
      bankSelection(newValue);
      update();
    }
  }

  List<SelectorItemModel> getCurrencyMenuItems() {
    return CurrencyType.values.map((unit) => unit.toMenuItem()).toList();
  }

  List<SelectorItemModel> getBankMenuItems() {
    return Bank.values.map((bank) => bank.toMenuItem()).toList();
  }

  RatesQuery buildRatesQuery() {
    return RatesQuery(
        currencyType: CurrencyType.values.byIndex(currencySelection.value),
        bank: Bank.values.byIndex(bankSelection.value));
  }
}
