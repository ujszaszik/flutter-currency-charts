import 'package:currency_charts/data/datasource/currency_remote_datasource.dart';
import 'package:currency_charts/data/repository/currency_repository.dart';
import 'package:currency_charts/parser/xml_parser.dart';
import 'package:get/get.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XmlParser());
    Get.lazyPut<ICurrencyRemoteDataSource>(() => CurrencyRemoteDataSource());
    Get.lazyPut<ICurrencyRepository>(() => CurrencyRepository(
        remoteDataSource: Get.find<ICurrencyRemoteDataSource>(),
        parser: Get.find<XmlParser>()));
  }
}
