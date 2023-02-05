import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/ui/table/rates_source.dart';

class BanksCurrencyItem extends RatesSource {
  final CurrencyType type;
  final double sellCurrency;
  final double buyCurrency;
  final double sellForEx;
  final double buyForEx;

  BanksCurrencyItem(
      {required this.type,
      required this.sellCurrency,
      required this.buyCurrency,
      required this.sellForEx,
      required this.buyForEx});

  @override
  Bank bank() {
    return Bank.KH;
  }

  @override
  CurrencyType currency() {
    return type;
  }

  @override
  double currencyBuy() {
    return buyCurrency;
  }

  @override
  double currencySell() {
    return sellCurrency;
  }

  @override
  double forExBuy() {
    return buyForEx;
  }

  @override
  double forExSell() {
    return sellForEx;
  }
}
