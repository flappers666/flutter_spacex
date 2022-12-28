import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/launches_api.dart';
import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';

abstract class LaunchesRepository {
  Future<ValueOrFail<List<LaunchModel>?>> getUpcomingLaunches();
  Future<ValueOrFail<LaunchModel?>> getLaunchDetail(String launchId);
}

class HttpLaunchesRepository implements LaunchesRepository {
  final LaunchesApi launchesApi;
  HttpLaunchesRepository(this.launchesApi);

  @override
  Future<ValueOrFail<List<LaunchModel>?>> getUpcomingLaunches() async {
    ApiResponse apiResponse = await launchesApi.launches();
    ValueOrFail<List<LaunchModel>?> response =
        ValueOrFail(value: null, errorMessage: null);
    if (apiResponse.success) {
      response.value = apiResponse.value;
    }
    response.errorMessage = apiResponse.apiError?.errorMessage;
    return response;
  }

  @override
  Future<ValueOrFail<LaunchModel?>> getLaunchDetail(String launchId) async {
    ApiResponse r = await launchesApi.launch(launchId);
    ValueOrFail<LaunchModel?> response =
        ValueOrFail(value: null, errorMessage: null);
    if (r.success) {
      response.value = r.value;
    }
    response.errorMessage = r.apiError?.errorMessage;
    return response;
  }
}
