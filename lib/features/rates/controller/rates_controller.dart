import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/data/repository/currency_repository.dart';
import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/model/currency/currency_model.dart';
import 'package:get/get.dart';

class RatesController extends GetxController {
  final ICurrencyRepository repository;

  RatesController({required this.repository});

  AwaitSource<CurrencyModel> getRatesFor(RatesQuery query) {
    return repository.getRatesFor(query);
  }
}
