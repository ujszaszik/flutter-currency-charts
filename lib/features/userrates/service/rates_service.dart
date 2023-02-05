import 'package:currency_charts/data/network/get_request.dart';
import 'package:currency_charts/data/service/base_service.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:http/http.dart' as http;

abstract class IRatesService extends BaseService {
  Future<http.Response> getConversionRatesFor(UserRatesQuery query);
}

class RatesService extends IRatesService {
  @override
  Future<http.Response> getConversionRatesFor(UserRatesQuery query) {
    return GetRequest.from(baseUrl)
        .queryParam(bankKey, query.bank.shortName())
        .queryParam(currencyKey, query.currencyType.shortName())
        .response();
  }
}
