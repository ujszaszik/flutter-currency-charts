import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/features/userrates/repository/user_rates_repository.dart';
import 'package:currency_charts/features/userrates/model/user_rates_model.dart';
import 'package:get/get.dart';

class UserRatesController extends GetxController {
  final IUserRatesRepository repository;

  UserRatesController({required this.repository});

  AwaitSource<UserRatesModel> getRatesFor(UserRatesQuery query) {
    return repository.getRatesFor(query);
  }
}
