class BankRateModel {
  double sellCurrency;
  double buyCurrency;
  double sellForEx;
  double buyForEx;

  BankRateModel(
      {required this.sellCurrency,
      required this.buyCurrency,
      required this.sellForEx,
      required this.buyForEx});

  factory BankRateModel.empty() {
    return BankRateModel(
        sellCurrency: 0, buyCurrency: 0, sellForEx: 0, buyForEx: 0);
  }
}
