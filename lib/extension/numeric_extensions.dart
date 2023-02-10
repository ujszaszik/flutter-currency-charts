extension FixedNumber on double {
  String formatted() {
    return toStringAsFixed(2);
  }
}

extension IsPositive on double {
  bool isPositive() {
    return this > 0.0;
  }
}
