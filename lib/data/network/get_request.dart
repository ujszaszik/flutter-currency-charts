import 'dart:collection';
import 'package:http/http.dart' as http;

class GetRequest {
  late String uri;
  late String path = "";
  Map<String, dynamic> queryParams = HashMap();

  GetRequest._();

  GetRequest({required this.uri});

  static GetRequest from(String uri) {
    return GetRequest(uri: uri);
  }

  GetRequest on(String path) {
    this.path = path;
    return this;
  }

  GetRequest queryParam(String key, dynamic value) {
    if (value != null) queryParams[key] = value;
    return this;
  }

  Future<http.Response> response() {
    return http.get(Uri.http(uri, path, queryParams));
  }
}