import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/api/launches_api.dart';
import 'package:flutter_spacex/core/api/rockets_api.dart';
import 'package:flutter_spacex/core/repositories/launches_repository.dart';
import 'package:flutter_spacex/core/repositories/rockets_repository.dart';
import 'package:flutter_spacex/core/services/launches_service.dart';
import 'package:flutter_spacex/core/services/rockets_service.dart';
import 'package:flutter_spacex/core/utilities/logger.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/core/router.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_bloc.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_bloc.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key) {
    _initialise();
  }

  Logger<App>? _logger;
  LaunchesApi? _launchesApi;
  LaunchesService? _launchesService;
  RocketsApi? _rocketsApi;
  RocketsService? _rocketsService;

  void _initialise() {
    _logger = Logger<App>(this);

    BaseOptions dioBaseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: 'application/json',
      validateStatus: (status) =>
          status != null && status >= 200 && status <= 299,
    );

    final Dio dio = Dio(dioBaseOptions);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      _logger!.verbose(options.toString());
      return handler.next(options);
    }, onResponse: (response, handler) {
      _logger!.verbose(response.toString());
      return handler.next(response);
    }, onError: (DioError e, handler) {
      _logger!.verbose(e.toString());
      return handler.next(e);
    }));

    _launchesApi = LaunchesApi(dio);
    _launchesService = LaunchesService(_launchesApi!);

    _rocketsApi = RocketsApi(dio);
    _rocketsService = RocketsService(_rocketsApi!);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LaunchesRepository>(
            create: (context) =>
                LaunchesRepository(launchesService: _launchesService!)),
        RepositoryProvider<RocketsRepository>(
            create: (context) =>
                RocketsRepository(rocketsService: _rocketsService!)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LaunchesBloc(
                launchesRepository: context.read<LaunchesRepository>()),
          ),
          BlocProvider(
            create: (context) => RocketsBloc(
                rocketsRepository: context.read<RocketsRepository>()),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(UiColors.background)),
          routerConfig: router,
        ),
      ),
    );
  }
}
