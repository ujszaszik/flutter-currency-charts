import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/util/date/date_range.dart';
import 'package:currency_charts/util/date/date_range_format.dart';

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

  factory ChartRatesQuery.inRange(DateRange range, CurrencyType currencyType) {
    final defaultDates = formatRange(range);
    return ChartRatesQuery(
        currencyType: currencyType,
        startDate: defaultDates.first,
        endDate: defaultDates.second);
  }

  factory ChartRatesQuery.basic(CurrencyType currencyType) {
    return ChartRatesQuery.inRange(DateRange.basic(), currencyType);
  }
}
