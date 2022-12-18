import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/launches_api.dart';
import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';

class LaunchesService {
  final LaunchesApi _launchApi;
  LaunchesService(this._launchApi);

  Future<ValueOrFail<List<LaunchModel>?>> getUpcomingLaunches() async {
    ApiResponse apiResponse = await _launchApi.getUpcomingLaunches();
    ValueOrFail<List<LaunchModel>?> response =
        ValueOrFail(value: null, errorMessage: null);
    if (apiResponse.success) {
      response.value = apiResponse.value;
    }
    response.errorMessage = apiResponse.apiError?.errorMessage;
    return response;
  }

  Future<ValueOrFail<LaunchModel?>> getLaunchDetail(String launchId) async {
    ApiResponse r = await _launchApi.getLaunchDetail(launchId);
    ValueOrFail<LaunchModel?> response =
        ValueOrFail(value: null, errorMessage: null);
    if (r.success) {
      response.value = r.value;
    }
    response.errorMessage = r.apiError?.errorMessage;
    return response;
  }
}