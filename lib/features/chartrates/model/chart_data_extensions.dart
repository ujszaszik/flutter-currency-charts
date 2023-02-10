import 'package:currency_charts/features/chartrates/model/charts_items.dart';

extension Extreme on ChartsItems {
  double max() {
    return items
        .map((item) => item.value)
        .reduce((curr, next) => curr > next ? curr : next);
  }

  double min() {
    return items
        .map((item) => item.value)
        .reduce((curr, next) => curr < next ? curr : next);
  }

  double avg() {
    return items.map((item) => item.value).reduce((curr, next) => curr + next) /
        size();
  }

  double size() {
    return items.length.toDouble();
  }

  double current() {
    return items.last.value;
  }

  double start() {
    return items.first.value;
  }

  double difference() {
    return current() - start();
  }

  double differencePercent() {
    return difference() / current() * 100;
  }

  double median() {
    final values = items.map((item) => item.value).toList();
    values.sort((a, b) => a.compareTo(b));
    var middle = values.length ~/ 2;
    if (values.length % 2 == 1) {
      return values[middle];
    } else {
      return (values[middle - 1] + values[middle]) / 2.0;
    }
  }
}
