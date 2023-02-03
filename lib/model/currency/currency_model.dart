import 'package:currency_charts/model/currency/currency_item.dart';

class CurrencyModel {
  final List<CurrencyItem> currencyModel;
  final List<CurrencyItem> exchangeModel;

  CurrencyModel({
   required this.currencyModel,
   required this.exchangeModel
});
}