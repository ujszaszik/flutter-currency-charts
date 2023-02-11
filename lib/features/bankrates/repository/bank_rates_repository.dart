import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/network/network_call.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/bankrates/model/banks_currencies_list.dart';
import 'package:currency_charts/features/bankrates/parser/bank_rates_xml_parser.dart';
import 'package:currency_charts/features/bankrates/query/banks_rates_query.dart';
import 'package:currency_charts/features/bankrates/service/bank_rates_service.dart';

abstract class IBankRatesRepository {
  AwaitSource<BanksCurrenciesList> getBankRatesFor(Bank bank);
}

class BankRatesRepository extends IBankRatesRepository {
  final IBankRatesService service;
  final BankRatesXmlParser parser;

  BankRatesRepository({required this.service, required this.parser});

  @override
  AwaitSource<BanksCurrenciesList> getBankRatesFor(Bank bank) {
    return networkCall(
        remoteCall: service.getAllRatesFor(BankRatesQuery(bank: bank)),
        mapper: (rawXml) => parser.parse(rawXml, bank));
  }
}
