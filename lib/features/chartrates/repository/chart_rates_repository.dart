import 'package:currency_charts/data/network/network_call.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';
import 'package:currency_charts/features/chartrates/parser/chart_rates_parser.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:currency_charts/features/chartrates/service/chart_rates_service.dart';

abstract class IChartRatesRepository {
  AwaitSource<ChartsItems> getChartRatesFor(ChartRatesQuery query);
}

class ChartRatesRepository extends IChartRatesRepository {
  final IChartRatesService service;
  final ChartRatesParser parser;

  ChartRatesRepository({required this.service, required this.parser});

  @override
  AwaitSource<ChartsItems> getChartRatesFor(ChartRatesQuery query) {
    return networkCall(
        remoteCall: service.getChartDataInRange(query),
        mapper: (rawXml) => parser.parse(rawXml));
  }
}
