import 'package:currency_charts/data/network/get_request.dart';
import 'package:currency_charts/data/service/base_service.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/chartrates/query/chart_rates_query.dart';
import 'package:http/http.dart' as http;

abstract class IChartRatesService extends BaseService {
  Future<http.Response> getChartDataInRange(ChartRatesQuery query);
}

class ChartRatesService extends IChartRatesService {
  @override
  Future<http.Response> getChartDataInRange(ChartRatesQuery query) {
    return GetRequest.from(baseUrl)
        .queryParam(bankKey, query.referenceBank)
        .queryParam(currencyKey, query.currencyType.shortName())
        .queryParam(dateStartKey, query.startDate)
        .queryParam(dateEndKey, query.endDate)
        .response();
  }
}
