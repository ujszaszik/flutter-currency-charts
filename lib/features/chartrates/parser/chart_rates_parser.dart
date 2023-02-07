import 'package:currency_charts/data/parser/parser_extensions.dart';
import 'package:currency_charts/data/parser/xml_parser.dart';
import 'package:currency_charts/features/chartrates/model/charts_data.dart';
import 'package:xml/xml.dart';

class ChartRatesParser extends XmlParser<ChartsItems> {
  @override
  ChartsItems parse(String rawXml) {
    final document = XmlDocument.parse(rawXml);
    return document
        .exchangeElements()
        .map((element) =>
            ChartsData(date: element.date(), value: element.mean()))
        .toList();
  }
}
