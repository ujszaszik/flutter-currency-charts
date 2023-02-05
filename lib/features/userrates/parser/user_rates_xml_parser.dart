import 'package:currency_charts/data/exception/empty_content_exception.dart';
import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/features/userrates/model/user_rates_item.dart';
import 'package:currency_charts/features/userrates/model/user_rates_model.dart';
import 'package:xml/xml.dart';

class UserRatesXmlParser {
  UserRatesModel parseModels(String rawXml) {
    final document = XmlDocument.parse(rawXml);
    try {
      return UserRatesModel(
          currencyModel: getCurrencyElement(document),
          exchangeModel: getExchangeElement(document));
    } catch (e) {
      throw EmptyContentException();
    }
  }

  UserRatesItem getCurrencyElement(XmlDocument document) {
    return document.currencyElements().map((e) => e.item()).first;
  }

  UserRatesItem getExchangeElement(XmlDocument document) {
    return document.exchangeElements().map((e) => e.item()).first;
  }
}
