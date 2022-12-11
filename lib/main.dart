import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/app.dart';
import 'package:flutter_spacex/core/launches/launches_api.dart';
import 'package:flutter_spacex/core/launches/launches_service.dart';

void main() {
  BaseOptions dioBaseOptions = BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    contentType: 'application/json',
    validateStatus: (status) =>
        status != null && status >= 200 && status <= 299,
  );

  final Dio dio = Dio(dioBaseOptions);

  final LaunchesApi launchesApi = LaunchesApi(dio);
  final LaunchesService launchesService = LaunchesService(launchesApi);

  runApp(App(launchesService: launchesService));
}
