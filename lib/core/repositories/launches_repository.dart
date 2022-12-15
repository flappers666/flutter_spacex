import 'package:flutter_spacex/core/dto/value_or_fail.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';
import 'package:flutter_spacex/core/services/launches_service.dart';

class LaunchesRepository {
  final LaunchesService launchesService;
  LaunchesRepository({required this.launchesService});

  Future<ValueOrFail<List<LaunchModel>?>> getUpcomingLaunches() async {
    return await launchesService.getUpcomingLaunches();
  }

  Future<ValueOrFail<LaunchModel?>> getLaunchDetail(String launchId) async {
    return await launchesService.getLaunchDetail(launchId);
  }
}
