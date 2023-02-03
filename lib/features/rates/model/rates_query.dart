import 'package:currency_charts/model/bank.dart';
import 'package:currency_charts/model/currency_type.dart';

class RatesQuery {
  RatesQuery({required this.currencyType, required this.bank});

  final CurrencyType currencyType;
  final Bank bank;

  static const String argsKey = 'NavArgs::RatesQuery';
}
