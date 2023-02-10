import 'package:currency_charts/extension/numeric_extensions.dart';

class BasedOnSign<T> {
  BasedOnSign(
      {required this.onPositive, required this.onNegative, this.onNeutral});

  final T onPositive;
  final T onNegative;
  final T? onNeutral;

  T getFrom(double value) {
    if (value.isPositive()) {
      return onPositive;
    } else if (value.isNegative) {
      return onNegative;
    } else if (onNeutral != null) {
      return onNeutral!;
    } else {
      return onPositive;
    }
  }
}
