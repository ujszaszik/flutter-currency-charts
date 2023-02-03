import 'package:currency_charts/model/currency/currency_model.dart';
import 'package:currency_charts/parser/parser_extensions.dart';
import 'package:currency_charts/model/currency/currency_item.dart';
import 'package:xml/xml.dart';

class XmlParser {

  CurrencyModel parseModels(String rawXml) {
    final document = XmlDocument.parse(rawXml);
    return CurrencyModel(
        currencyModel: getCurrencyElements(document),
        exchangeModel: getExchangeElements(document)
    );
  }

  List<CurrencyItem> getCurrencyElements(XmlDocument document) {
    return document.currencyElements()
        .map((e) => e.item())
        .toList();
  }

  List<CurrencyItem> getExchangeElements(XmlDocument document) {
    return document.exchangeElements()
        .map((e) => e.item())
        .toList();
  }

}