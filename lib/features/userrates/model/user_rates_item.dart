class UserRatesItem {
  final String bank;
  final String date;
  final String currency;
  final double sell;
  final double buy;

  UserRatesItem(
      {required this.bank,
      required this.date,
      required this.currency,
      required this.sell,
      required this.buy});
}
