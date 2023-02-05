import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/data/model/currency_type.dart';
import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/userrates/model/user_rates_item.dart';
import 'package:currency_charts/ui/table/rates_source.dart';

class UserRatesModel extends RatesSource {
  final UserRatesItem currencyModel;
  final UserRatesItem exchangeModel;

  UserRatesModel({required this.currencyModel, required this.exchangeModel});

  @override
  Bank bank() {
    return Bank.values.firstWhere(
        (element) => element.shortName().toUpperCase() == currencyModel.bank);
  }

  @override
  CurrencyType currency() {
    return CurrencyType.values.firstWhere((element) =>
        element.shortName().toUpperCase() == currencyModel.currency);
  }

  @override
  double currencyBuy() {
    return currencyModel.buy;
  }

  @override
  double currencySell() {
    return currencyModel.buy;
  }

  @override
  double forExBuy() {
    return exchangeModel.buy;
  }

  @override
  double forExSell() {
    return exchangeModel.sell;
  }
}
