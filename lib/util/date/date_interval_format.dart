import 'package:currency_charts/util/date/date_interval.dart';
import 'package:currency_charts/util/date/date_range.dart';
import 'package:intl/intl.dart';

const String formatType = 'yyyy.MM.dd';
final formatter = DateFormat(formatType);

String formatInterval(DateInterval interval) {
  final range = DateRange.fromWeekInterval(interval);
  final startText = formatter.format(range.start);
  final endText = formatter.format(range.end);
  return '$startText - $endText';
}
