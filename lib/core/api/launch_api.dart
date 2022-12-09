import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_client.dart';

class LaunchApi extends ApiClient {
  LaunchApi(Dio httpClient) : super(httpClient);
}
