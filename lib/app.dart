import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/launches/launches_repository.dart';
import 'package:flutter_spacex/core/launches/launches_service.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/core/router.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_bloc.dart';

class App extends StatelessWidget {
  const App({required this.launchesService, Key? key}) : super(key: key);

  final LaunchesService launchesService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LaunchesRepository>(
            create: (context) =>
                LaunchesRepository(launchesService: launchesService)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LaunchesBloc(
                launchesRepository: context.read<LaunchesRepository>()),
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
