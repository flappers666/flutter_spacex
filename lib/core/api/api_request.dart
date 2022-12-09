import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_client.dart';

class ApiRequest {
  String host;
  HttpMethod method;
  String path;
  Map<String, dynamic>? queryParams;
  List<Headers>? headers;
  Map<String, dynamic>? body;

  ApiRequest(
      {required this.host,
      required this.method,
      required this.path,
      this.queryParams,
      this.headers,
      this.body});
}
