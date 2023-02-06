import 'package:currency_charts/features/userrates/controller/user_rates_controller.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/features/userrates/ui/user_rates_header.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/screen/resource_aware_screen.dart';
import 'package:currency_charts/ui/table/rates_source.dart';
import 'package:currency_charts/ui/table/rates_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRatesScreen extends GetView<UserRatesController> {
  const UserRatesScreen({Key? key}) : super(key: key);

  static const route = '/rates';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserRatesController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text(Strings.ratesQueryTitle)),
          body: Center(
              child: ResourceAwareScreen(
            stream: controller.getRatesFor(getQuery()),
            mainScreen: (data) => _userRatesContent(getQuery(), data),
          ))),
    );
  }

  Widget _userRatesContent(UserRatesQuery query, RatesSource model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [userRatesHeader(getQuery()), ratesTable(model)],
    );
  }

  UserRatesQuery getQuery() {
    return Get.arguments[UserRatesQuery.argsKey];
  }
}
