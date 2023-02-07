import 'package:currency_charts/data/model/currency_type.dart';

class ChartRatesQuery {
  final String referenceBank = 'mnb';
  final CurrencyType currencyType;
  final String startDate;
  final String endDate;

  static const argsKey = 'NavArgs::CharRatesQuery';

  ChartRatesQuery(
      {required this.currencyType,
      required this.startDate,
      required this.endDate});
}
