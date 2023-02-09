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
}
