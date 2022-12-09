import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_error.dart';
import 'package:flutter_spacex/core/api/api_request.dart';

enum HttpMethod { get, post, patch, put, delete }

abstract class ApiClient {
  final Dio _httpClient;
  final String _scheme = 'https';

  ApiClient(this._httpClient);

  String _prepareUrl(
      {required String host,
      required String path,
      Map<String, dynamic>? queryParams}) {
    return Uri(
      scheme: _scheme,
      host: host,
      path: path,
      queryParameters: queryParams ?? {},
    ).toString();
  }

  Future<Response> _getRequest(
      {required String host,
      required String path,
      Map<String, dynamic>? queryParams}) async {
    var url = _prepareUrl(host: host, path: path, queryParams: queryParams);
    try {
      return await _httpClient.get(url);
    } on DioError catch (e) {
      throw ApiError(e.error.toString());
    }
  }

  Future<Response> makeApiRequest(ApiRequest request) {
    switch (request.method) {
      case HttpMethod.get:
        return _getRequest(
            host: request.host,
            path: request.path,
            queryParams: request.queryParams);
      default:
        return _getRequest(host: request.host, path: request.path);
    }
  }
}
