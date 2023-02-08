import 'package:currency_charts/util/date/date_interval.dart';

const _dayPerWeek = 7;

class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({required this.start, required this.end});

  factory DateRange.fromWeekInterval(DateInterval interval) {
    return DateRange.forWeeks(interval.amount);
  }

  factory DateRange.basic() {
    return DateRange.forWeeks(DateInterval.oneWeek.amount);
  }

  factory DateRange.forWeeks(int numberOfWeeks) {
    final now = DateTime.now();
    final calculated = DateTime.now()
        .subtract(Duration(days: (numberOfWeeks * _dayPerWeek) - 1));
    return DateRange(start: calculated, end: now);
  }
}
