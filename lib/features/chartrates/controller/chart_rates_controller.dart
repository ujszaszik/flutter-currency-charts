import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/repository/chart_rates_repository.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:currency_charts/util/date/date_range.dart';
import 'package:currency_charts/util/date/date_range_format.dart';
import 'package:get/get.dart';

class ChartRatesController extends GetxController {
  final IChartRatesRepository repository;

  ChartRatesController({required this.repository});

  late ChartRatesQuery _currentQuery;
  final selectedIndex = DateInterval.oneWeek.index.obs;
  final chartItems = const AwaitSource<ChartsItems>.empty().obs;

  getChartItems(ChartRatesQuery query) {
    _currentQuery = query;
    chartItems(repository.getChartRatesFor(query));
    update();
  }

  updateItems(DateInterval interval) {
    final range = DateRange.fromWeekInterval(interval);
    final formattedRange = formatRange(range);
    final query = ChartRatesQuery(
        currencyType: _currentQuery.currencyType,
        startDate: formattedRange.first,
        endDate: formattedRange.second);
    getChartItems(query);
    _updateInterval(interval);
  }

  _updateInterval(DateInterval interval) {
    selectedIndex(interval.index);
    update();
  }
}
