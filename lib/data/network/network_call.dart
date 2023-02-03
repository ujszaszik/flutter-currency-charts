import 'package:currency_charts/data/network/resource.dart';
import 'package:http/http.dart' as http;

Stream<Resource<Local>> networkCall<Local>({
    required Future<http.Response> remoteCall,
    required Local Function(dynamic) mapper}) async* {
  yield Resource.loading();
  try {
    final response = await remoteCall;
    if (response.statusCode == 200) {
      final mappedResponse = mapper(response.body);
      yield Resource.success(mappedResponse);
    } else {
      yield Resource.error(response.reasonPhrase!);
    }
  } catch (e) {
    yield Resource.error(e.toString());
  }
}