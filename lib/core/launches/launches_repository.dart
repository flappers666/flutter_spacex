import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/launches/launches_service.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';

class LaunchesRepository {
  final LaunchesService launchesService;
  LaunchesRepository({required this.launchesService});

  Future<ValueOrFail<List<LaunchModel>?>> getUpcomingLaunches() async {
    return await launchesService.getUpcomingLaunches();
  }
}
