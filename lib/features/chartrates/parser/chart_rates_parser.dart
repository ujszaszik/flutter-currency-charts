import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/data/parser/xml_parser.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';
import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:xml/xml.dart';

class ChartRatesParser
    extends ParameterizedXmlParser<ChartsItems, CurrencyType> {
  @override
  ChartsItems parse(String rawXml, CurrencyType parameter) {
    final document = XmlDocument.parse(rawXml);
    final items = document
        .exchangeElements()
        .map((element) =>
            ChartsData(date: element.date(), value: element.mean()))
        .toList();
    return ChartsItems(items: items, currencyType: parameter);
  }
}
