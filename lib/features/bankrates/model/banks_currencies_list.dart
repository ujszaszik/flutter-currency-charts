import 'package:currency_charts/features/bankrates/model/banks_currency_item.dart';
import 'package:currency_charts/data/model/bank.dart';

class BanksCurrenciesList {
  final Bank bank;
  final List<BanksCurrencyItem> items;

  BanksCurrenciesList({required this.bank, required this.items});
}
