import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';

class UserRatesQuery {
  UserRatesQuery({required this.currencyType, required this.bank});

  final CurrencyType currencyType;
  final Bank bank;

  static const String argsKey = 'NavArgs::UserRatesQuery';
}
