import 'package:currency_charts/data/network/get_request.dart';
import 'package:currency_charts/data/service/base_service.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:http/http.dart' as http;

abstract class ICurrencyRatesService extends BaseService {
  Future<http.Response> getRatesFor(CurrencyRatesQuery query);
}

class CurrencyRatesService extends ICurrencyRatesService {
  @override
  Future<http.Response> getRatesFor(CurrencyRatesQuery query) {
    return GetRequest.from(baseUrl)
        .queryParam(currencyKey, query.type.shortName())
        .response();
  }
}
