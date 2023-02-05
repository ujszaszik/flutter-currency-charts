import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';

abstract class RatesSource {
  Bank bank();

  CurrencyType currency();

  double currencyBuy();

  double currencySell();

  double forExBuy();

  double forExSell();
}
