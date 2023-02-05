import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/bankrates/repository/bank_rates_repository.dart';
import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/features/bankrates/model/banks_currencies_list.dart';
import 'package:get/get.dart';

class BankRatesController extends GetxController {
  final IBankRatesRepository repository;

  BankRatesController({required this.repository});

  AwaitSource<BanksCurrenciesList> getRatesFor(Bank bank) {
    return repository.getBankRatesFor(bank);
  }
}
