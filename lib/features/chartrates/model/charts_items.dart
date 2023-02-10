import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';

class ChartsItems {
  List<ChartsData> items;
  CurrencyType currencyType;

  ChartsItems({required this.items, required this.currencyType});
}