import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/core/services/launches_service.dart';
import 'package:flutter_spacex/core/services/rockets_service.dart';

class RocketsRepository {
  final RocketsService rocketsService;
  RocketsRepository({required this.rocketsService});

  Future<ValueOrFail<List<RocketModel>?>> getRockets() async {
    return await rocketsService.getRockets();
  }
}
