import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:currency_charts/util/date/date_range.dart';
import 'package:get/get.dart';

class ChartsController extends GetxController {
  final currencySelection = 0.obs;

  updateCurrencySelection(int? newValue) {
    if (newValue != null && currencySelection.value != newValue) {
      currencySelection(newValue);
      update();
    }
  }

  List<SelectorItemModel> getCurrencyMenuItems() {
    return CurrencyType.values.map((unit) => unit.toMenuItem()).toList();
  }

  ChartRatesQuery buildQuery() {
    final currency = CurrencyType.values
        .firstWhere((currency) => currency.index == currencySelection.value);
    return ChartRatesQuery.inRange(
        DateRange.fromWeekInterval(DateInterval.oneWeek), currency);
  }
}
