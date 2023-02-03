import 'package:currency_charts/data/datasource/currency_remote_datasource.dart';
import 'package:currency_charts/data/network/network_call.dart';
import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/model/currency/currency_model.dart';
import 'package:currency_charts/parser/xml_parser.dart';

abstract class ICurrencyRepository {
  AwaitSource<CurrencyModel> getRatesFor(RatesQuery query);
}

class CurrencyRepository extends ICurrencyRepository {
  final ICurrencyRemoteDataSource remoteDataSource;
  final XmlParser parser;

  CurrencyRepository({required this.remoteDataSource, required this.parser});

  @override
  AwaitSource<CurrencyModel> getRatesFor(RatesQuery query) {
    return networkCall(
        remoteCall: remoteDataSource.getConversionRatesFor(query),
        mapper: (rawXml) => parser.parseModels(rawXml));
  }
}
