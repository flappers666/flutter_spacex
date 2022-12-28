import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/api/launches_api.dart';
import 'package:flutter_spacex/core/api/rockets_api.dart';
import 'package:flutter_spacex/core/repositories/launches_repository.dart';
import 'package:flutter_spacex/core/repositories/rockets_repository.dart';
import 'package:flutter_spacex/core/utilities/logger.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/core/router.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_bloc.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_bloc.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_bloc.dart';

class App extends StatelessWidget {
  late final Logger<App> _logger;
  late final Dio dio;

  App({Key? key}) : super(key: key) {
    _logger = Logger<App>(this);
    BaseOptions dioBaseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: 'application/json',
      validateStatus: (status) =>
          status != null && status >= 200 && status <= 299,
    );

    dio = Dio(dioBaseOptions);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      _logger.verbose(options.toString());
      return handler.next(options);
    }, onResponse: (response, handler) {
      _logger.verbose(response.toString());
      return handler.next(response);
    }, onError: (DioError e, handler) {
      _logger.verbose(e.toString());
      return handler.next(e);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LaunchesRepository>(
            create: (context) => HttpLaunchesRepository(LaunchesApi(dio))),
        RepositoryProvider<RocketsRepository>(
            create: (context) => HttpRocketsRepository(RocketsApi(dio)))
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
          BlocProvider(
            create: (context) => RocketDetailBloc(),
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
