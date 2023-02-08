import 'package:currency_charts/util/date/date_range.dart';

enum DateInterval {
  oneWeek(1),
  twoWeeks(2),
  threeWeeks(3),
  fourWeeks(4);

  final int amount;

  const DateInterval(this.amount);

  DateRange getActualRange() {
    return DateRange.fromWeekInterval(this);
  }

  String text() {
    return amount.toString() + 'W';
  }
}
