import 'package:currency_charts/data/network/network_call.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_model.dart';
import 'package:currency_charts/features/currencyrates/parser/currency_rates_parser.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:currency_charts/features/currencyrates/service/currency_rates_service.dart';

abstract class ICurrencyRatesRepository {
  AwaitSource<CurrencyRatesModel> getCurrencyRatesFor(CurrencyRatesQuery query);
}

class CurrencyRatesRepository extends ICurrencyRatesRepository {
  final ICurrencyRatesService service;
  final CurrencyRatesParser parser;

  CurrencyRatesRepository({required this.service, required this.parser});

  @override
  AwaitSource<CurrencyRatesModel> getCurrencyRatesFor(
      CurrencyRatesQuery query) {
    return networkCall(
        remoteCall: service.getRatesFor(query),
        mapper: (rawXml) => parser.parse(rawXml));
  }
}
