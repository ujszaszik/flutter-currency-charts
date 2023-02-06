import 'package:currency_charts/data/model/currency_type.dart';
import 'package:get/get.dart';

class CurrenciesController extends GetxController {
  List<CurrencyType> getCurrencies() {
    return CurrencyType.values;
  }

  int currenciesCount = CurrencyType.values.length;
}
