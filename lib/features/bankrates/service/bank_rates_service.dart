import 'package:currency_charts/data/service/base_service.dart';
import 'package:currency_charts/data/network/get_request.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:http/http.dart' as http;

abstract class IBankRatesService extends BaseService{
  Future<http.Response> getAllRatesFor(BankRatesQuery query);
}

class BankRatesService extends IBankRatesService {
  @override
  Future<http.Response> getAllRatesFor(BankRatesQuery query) {
    return GetRequest.from(baseUrl)
        .queryParam(bankKey, query.bank.shortName())
        .response();
  }
}