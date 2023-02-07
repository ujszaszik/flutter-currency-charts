import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/repository/chart_rates_repository.dart';
import 'package:get/get.dart';

class ChartRatesController extends GetxController {
  final IChartRatesRepository repository;

  ChartRatesController({required this.repository});

  AwaitSource<ChartsItems> getChartItems() {
    return repository.getChartRatesFor(_testQuery());
  }

  ChartRatesQuery _testQuery() {
    return ChartRatesQuery(
        currencyType: CurrencyType.EUR,
        startDate: '20230115',
        endDate: '20230118');
  }
}
