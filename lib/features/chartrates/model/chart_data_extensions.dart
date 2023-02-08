import 'package:currency_charts/features/chartrates/model/charts_data.dart';

extension Extreme on ChartsItems {
  double max() {
    return map((item) => item.value)
        .reduce((curr, next) => curr > next ? curr : next);
  }

  double min() {
    return map((item) => item.value)
        .reduce((curr, next) => curr < next ? curr : next);
  }

  double avg() {
    return map((item) => item.value)
        .reduce((curr, next) => curr + next) / size();
  }

  double size() {
    return length.toDouble();
  }
}
