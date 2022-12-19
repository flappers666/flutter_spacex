import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/constants/app_routes.dart';
import 'package:flutter_spacex/views/home/home_nav_bar.dart';
import 'package:flutter_spacex/views/info/info.dart';
import 'package:flutter_spacex/views/launch_detail/launch_detail.dart';
import 'package:flutter_spacex/views/launches/launches.dart';
import 'package:flutter_spacex/views/rocket_detail/rocket_detail.dart';
import 'package:flutter_spacex/views/rockets/rockets.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.launches,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => HomeNavBar(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.launches,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Launches()),
              routes: [
                GoRoute(
                    path: AppRoutes.launchDetail,
                    builder: (context, state) =>
                        LaunchDetail(launchDetail: state.extra as LaunchModel)),
              ],
            ),
            GoRoute(
              path: AppRoutes.rockets,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Rockets()),
              routes: [
                GoRoute(
                    path: AppRoutes.rocketDetail,
                    builder: (context, state) =>
                        RocketDetail(rocket: state.extra as RocketModel)),
              ],
            ),
            GoRoute(
              path: AppRoutes.info,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Info()),
            )
          ]),
    ]);
