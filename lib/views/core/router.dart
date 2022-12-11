import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/app_routes.dart';
import 'package:flutter_spacex/views/home/home_nav_bar.dart';
import 'package:flutter_spacex/views/launch_detail/launch_detail.dart';
import 'package:flutter_spacex/views/launches/launches.dart';
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
              builder: (context, state) => const Launches(),
              routes: [
                GoRoute(
                    path: AppRoutes.launchDetail,
                    builder: (context, state) =>
                        LaunchDetail(launchDetail: state.extra as LaunchModel)),
              ],
            ),
          ]),
    ]);
