import 'package:currency_charts/data/model/bank.dart';

class BankRatesQuery {
  final Bank bank;

  static const argsKey = 'NavArgs::BankRatesQuery';

  BankRatesQuery({required this.bank});
}
