import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/ui/table/rates_source.dart';

class CurrencyRatesItem extends RatesSource {
  final Bank bankType;
  final double sellCurrency;
  final double buyCurrency;
  final double sellForEx;
  final double buyForEx;

  CurrencyRatesItem(
      {required this.bankType,
      required this.sellCurrency,
      required this.buyCurrency,
      required this.sellForEx,
      required this.buyForEx});

  @override
  String headerImageName() {
    return bankType.imageName();
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
