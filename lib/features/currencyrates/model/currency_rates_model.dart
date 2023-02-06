import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_item.dart';

class CurrencyRatesModel {
  final CurrencyType type;
  final List<CurrencyRatesItem> items;

  CurrencyRatesModel({required this.type, required this.items});
}
