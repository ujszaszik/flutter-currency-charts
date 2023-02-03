import 'package:currency_charts/data/network/get_request.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/model/bank.dart';
import 'package:http/http.dart' as http;

typedef AwaitSource<T> = Stream<Resource<T>>;

abstract class ICurrencyRemoteDataSource {
  Future<http.Response> getConversionRatesFor(RatesQuery query);
}

class CurrencyRemoteDataSource extends ICurrencyRemoteDataSource {
  final String _baseUrl = "api.napiarfolyam.hu";

  static const _bankKey = 'bank';
  static const _currencyKey = 'valuta';

  @override
  Future<http.Response> getConversionRatesFor(RatesQuery query) {
    return GetRequest.from(_baseUrl)
        .queryParam(_bankKey, query.bank.shortName())
        .queryParam(_currencyKey, query.currencyType.shortName())
        .response();
  }
}
