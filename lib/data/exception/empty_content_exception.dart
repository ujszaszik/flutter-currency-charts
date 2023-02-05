import 'package:currency_charts/resources/strings.dart';

class EmptyContentException implements Exception {
  final String message = Strings.emptyPageTitle;

  @override
  String toString() {
    return message;
  }
}
