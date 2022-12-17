import 'package:dio/dio.dart';
import 'package:flutter_spacex/core/api/api_client.dart';
import 'package:flutter_spacex/core/api/api_error.dart';
import 'package:flutter_spacex/core/api/api_request.dart';
import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/constants.dart';
import 'package:flutter_spacex/core/api/utils.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

class RocketsApi extends ApiClient {
  RocketsApi(Dio httpClient) : super(httpClient);

  Future<ApiResponse> getRockets() async {
    try {
      var request = ApiRequest(
          host: ApiConstants.spacexUrl,
          method: HttpMethod.get,
          path: '${ApiConstants.apiVersion}/rockets');
      var response = await makeApiRequest(request);

      var launches = Utils.jsonArrayToList<RocketModel>(
          response.data, RocketModel.fromJson);
      return ApiResponse(success: true, value: launches);
    } on ApiError catch (e) {
      return ApiResponse(success: false, apiError: e);
    }
  }
}
