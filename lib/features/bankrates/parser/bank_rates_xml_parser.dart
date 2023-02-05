import 'dart:collection';

import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/data/parser/xml_parser.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/bankrates/model/banks_currencies_list.dart';
import 'package:currency_charts/features/bankrates/model/banks_currency_item.dart';
import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';
import 'package:xml/xml.dart';

class BankRatesXmlParser extends XmlParser<BanksCurrenciesList> {
  final Map<CurrencyType, List<double>> data = SplayTreeMap();

  @override
  BanksCurrenciesList parse(String rawXml) {
    final document = XmlDocument.parse(rawXml);
    _processElements(document);
    final items = _parseItems();
    return BanksCurrenciesList(bank: Bank.KH, items: items);
  }

  void _processElements(XmlDocument document) {
    _processCurrencyElements(document);
    _processExchangeElements(document);
  }

  void _processCurrencyElements(XmlDocument document) {
    document.currencyElements().forEach((element) {
      final currency = _parseCurrencyType(element);
      if (currency != null) {
        data[currency] = [element.sell(), element.buy()];
      }
    });
  }

  void _processExchangeElements(XmlDocument document) {
    document.exchangeElements().forEach((element) {
      final currency = _parseCurrencyType(element);
      if (currency != null) {
        var newList = data[currency];
        newList?.addAll([element.sell(), element.buy()]);
        newList ??= [0.0, 0.0, element.sell(), element.buy()];
        data[currency] = newList;
      }
    });
  }

  List<BanksCurrencyItem> _parseItems() {
    final items = <BanksCurrencyItem>[];
    data.forEach((key, value) => items.add(BanksCurrencyItem(
        type: key,
        sellCurrency: value[0],
        buyCurrency: value[1],
        sellForEx: value[2],
        buyForEx: value[3])));
    return items;
  }

  CurrencyType? _parseCurrencyType(XmlElement element) {
    return CurrencyType.values.firstWhere(
        (currency) => currency.shortName().toUpperCase() == element.unit());
  }
}
