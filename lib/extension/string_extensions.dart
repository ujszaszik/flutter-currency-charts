extension ReplaceForUnkown on String {
  String replaceUnknownValue() {
    if (this == '0.0') {
      return '-';
    } else {
      return toString();
    }
  }
}
