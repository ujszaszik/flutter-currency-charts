import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/currencyrates/model/currency_rates_item.dart';
import 'package:currency_charts/features/currencyrates/query/currency_rates_query.dart';
import 'package:currency_charts/features/currencyrates/repository/currency_rates_repository.dart';
import 'package:get/get.dart';

class CurrencyRatesController extends GetxController {
  final ICurrencyRatesRepository repository;

  CurrencyRatesController({required this.repository});

  AwaitSource<CurrencyRatesModel> getCurrencyRatesFor(
      CurrencyRatesQuery query) {
    return repository.getCurrencyRatesFor(query);
  }
}
