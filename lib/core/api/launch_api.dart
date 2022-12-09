import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_client.dart';
import 'package:flutter_spacex/core/api/api_error.dart';
import 'package:flutter_spacex/core/api/api_request.dart';
import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/constants.dart';
import 'package:flutter_spacex/core/api/utils.dart';
import 'package:flutter_spacex/core/models/launch_model.dart';

class LaunchApi extends ApiClient {
  LaunchApi(Dio httpClient) : super(httpClient);

  Future<ApiResponse> getUpcomingLaunches() async {
    try {
      var request = ApiRequest(
          host: ApiConstants.spacexUrl,
          method: HttpMethod.get,
          path: '${ApiConstants.apiVersion}/launches/upcoming');
      var response = await makeApiRequest(request);

      var launches = Utils.jsonArrayToList<LaunchModel>(
          response.data, LaunchModel.fromJson);
      return ApiResponse(success: true, value: launches);
    } on ApiError catch (e) {
      return ApiResponse(success: false, apiError: e);
    }
  }

  Future<ApiResponse> getLaunchDetail(String launchId) async {
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
