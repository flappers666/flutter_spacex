import 'package:flutter_spacex/core/api/api_response.dart';
import 'package:flutter_spacex/core/api/rockets_api.dart';
import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';

abstract class RocketsRepository {
  Future<ValueOrFail<List<RocketModel>?>> getRockets();
}

class HttpRocketsRepository implements RocketsRepository {
  final RocketsApi rocketsApi;
  HttpRocketsRepository(this.rocketsApi);

  @override
  Future<ValueOrFail<List<RocketModel>?>> getRockets() async {
    ApiResponse apiResponse = await rocketsApi.rockets();
    ValueOrFail<List<RocketModel>?> response =
        ValueOrFail(value: null, errorMessage: null);
    if (apiResponse.success) {
      response.value = apiResponse.value;
    }
    response.errorMessage = apiResponse.apiError?.errorMessage;
    return response;
  }
}
