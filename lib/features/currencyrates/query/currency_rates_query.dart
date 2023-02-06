import 'package:currency_charts/data/model/currency_type.dart';

class CurrencyRatesQuery {
  final CurrencyType type;

  static const String argsKey = 'NavArgs::CurrencyRatesQuery';

  CurrencyRatesQuery({required this.type});
}
