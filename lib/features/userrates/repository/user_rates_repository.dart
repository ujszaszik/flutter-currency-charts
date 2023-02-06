import 'package:currency_charts/data/network/network_call.dart';
import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/features/userrates/parser/user_rates_xml_parser.dart';
import 'package:currency_charts/features/userrates/service/user_rates_service.dart';
import 'package:currency_charts/features/userrates/model/user_rates_model.dart';

abstract class IUserRatesRepository {
  AwaitSource<UserRatesModel> getRatesFor(UserRatesQuery query);
}

class UserRatesRepository extends IUserRatesRepository {

  final IUserRatesService service;
  final UserRatesXmlParser parser;

  UserRatesRepository({required this.service, required this.parser});

  @override
  AwaitSource<UserRatesModel> getRatesFor(UserRatesQuery query) {
    return networkCall(
        remoteCall: service.getConversionRatesFor(query),
        mapper: (rawXml) => parser.parseModels(rawXml));
  }
}
