import 'package:currency_charts/resources/Strings.dart';

enum ConversionType {
  currency(Strings.currencyValue),
  foreignExchange(Strings.forExValue);

  final String text;

  const ConversionType(this.text);
}
