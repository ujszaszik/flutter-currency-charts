class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({required this.start, required this.end});

  factory DateRange.fromWeekInterval(int numberOfWeeks) {
    return calculateRangeForWeek(numberOfWeeks);
  }
}

const _dayPerWeek = 7;

DateRange calculateRangeForWeek(int numberOfWeeks) {
  final now = DateTime.now();
  final calculated = now;
  calculated.subtract(Duration(days: numberOfWeeks * _dayPerWeek));
  return DateRange(start: calculated, end: now);
}
