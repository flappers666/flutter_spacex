import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/launches/launches_api.dart';
import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';

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
}
