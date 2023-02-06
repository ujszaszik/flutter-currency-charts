import 'dart:collection';

import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/data/parser/xml_parser.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_item.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_model.dart';
import 'package:xml/xml.dart';

class CurrencyRatesParser extends XmlParser<CurrencyRatesModel> {
  Map<Bank, List<double>> data = SplayTreeMap();

  @override
  CurrencyRatesModel parse(String rawXml) {
    final document = XmlDocument.parse(rawXml);
    _processElements(document);
    final items = _parseItems();
    return CurrencyRatesModel(type: CurrencyType.AUD, items: items);
  }

  void _processElements(XmlDocument document) {
    _processCurrencyElements(document);
    _processExchangeElements(document);
  }

  void _processCurrencyElements(XmlDocument document) {
    document.currencyElements().forEach((element) {
      final bank = _parseBankType(element);
      if (bank != null) {
        data[bank] = [element.sell(), element.buy()];
      }
    });
  }

  void _processExchangeElements(XmlDocument document) {
    document.exchangeElements().forEach((element) {
      final bank = _parseBankType(element);
      if (bank != null) {
        var newList = data[bank];
        newList?.addAll([element.sell(), element.buy()]);
        newList ??= [0.0, 0.0, element.sell(), element.buy()];
        data[bank] = newList;
      }
    });
  }

  List<CurrencyRatesItem> _parseItems() {
    final items = <CurrencyRatesItem>[];
    data.forEach((key, value) => items.add(CurrencyRatesItem(
        bankType: key,
        sellCurrency: value[0],
        buyCurrency: value[1],
        sellForEx: value[2],
        buyForEx: value[3])));
    return items;
  }

  Bank? _parseBankType(XmlElement element) {
    try {
      return Bank.values
          .firstWhere((bank) => bank.shortName() == element.bank());
    } catch (e) {
      return null;
    }
  }
}
