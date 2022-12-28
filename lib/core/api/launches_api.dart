import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_client.dart';
import 'package:flutter_spacex/core/api/api_error.dart';
import 'package:flutter_spacex/core/api/api_request.dart';
import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/constants.dart';
import 'package:flutter_spacex/core/api/utils.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';

class LaunchesApi extends ApiClient {
  LaunchesApi(Dio httpClient) : super(httpClient);

  Future<ApiResponse> launches() async {
    try {
      var request = ApiRequest(
          host: ApiConstants.spacexUrl,
          method: HttpMethod.get,
          path: '${ApiConstants.apiVersion}/launches');
      var response = await makeApiRequest(request);

      var launches = Utils.jsonArrayToList<LaunchModel>(
          response.data, LaunchModel.fromJson);
      return ApiResponse(success: true, value: launches);
    } on ApiError catch (e) {
      return ApiResponse(success: false, apiError: e);
    }
  }

  Future<ApiResponse> launch(String launchId) async {
    try {
      var request = ApiRequest(
          host: ApiConstants.spacexUrl,
          method: HttpMethod.get,
          path: '${ApiConstants.apiVersion}/launches/$launchId');
      var response = await makeApiRequest(request);
      var launches = LaunchModel.fromJson(response.data);
      return ApiResponse(success: true, value: launches);
    } on ApiError catch (e) {
      return ApiResponse(success: false, apiError: e);
    }
  }
}
