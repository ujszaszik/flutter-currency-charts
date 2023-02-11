import 'dart:collection';

import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/data/parser/xml_parser.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/bankrates/model/bank_rate_model.dart';
import 'package:currency_charts/features/bankrates/model/banks_currencies_list.dart';
import 'package:currency_charts/features/bankrates/model/banks_currency_item.dart';
import 'package:xml/xml.dart';

class BankRatesXmlParser
    extends ParameterizedXmlParser<BanksCurrenciesList, Bank> {
  final Map<CurrencyType, BankRateModel> data = SplayTreeMap();

  @override
  BanksCurrenciesList parse(String rawXml, Bank parameter) {
    final document = XmlDocument.parse(rawXml);
    _processElements(document);
    final items = _parseItems();
    return BanksCurrenciesList(bank: parameter, items: items);
  }

  void _processElements(XmlDocument document) {
    _processCurrencyElements(document);
    _processExchangeElements(document);
  }

  void _processCurrencyElements(XmlDocument document) {
    document.currencyElements().forEach((element) {
      final currency = _parseCurrencyType(element);
      if (currency != null) {
        final model = BankRateModel.empty()
          ..sellCurrency = element.sell()
          ..buyCurrency = element.buy();
        data[currency] = model;
      }
    });
  }

  void _processExchangeElements(XmlDocument document) {
    document.exchangeElements().forEach((element) {
      final currency = _parseCurrencyType(element);
      if (currency != null) {
        var model = data[currency] ?? BankRateModel.empty();
        model
          ..sellForEx = element.sell()
          ..buyForEx = element.buy();
        data[currency] = model;
      }
    });
  }

  List<BanksCurrencyItem> _parseItems() {
    final items = <BanksCurrencyItem>[];
    data.forEach((key, value) => items.add(BanksCurrencyItem(
        type: key,
        sellCurrency: value.sellCurrency,
        buyCurrency: value.buyCurrency,
        sellForEx: value.sellForEx,
        buyForEx: value.buyForEx)));
    return items;
  }

  CurrencyType? _parseCurrencyType(XmlElement element) {
    try {
      return CurrencyType.values.firstWhere(
          (currency) => currency.shortName().toUpperCase() == element.unit());
    } catch (e) {
      return null;
    }
  }
}
