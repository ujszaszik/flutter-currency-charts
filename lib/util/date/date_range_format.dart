import 'package:currency_charts/util/date/date_range.dart';
import 'package:currency_charts/util/pair.dart';
import 'package:intl/intl.dart';

const String formatType = 'yyyyMMdd';
final formatter = DateFormat(formatType);

Pair<String, String> formatRange(DateRange range) {
  final startText = formatter.format(range.start);
  final endText = formatter.format(range.end);
  return Pair(first: startText, second: endText);
}
