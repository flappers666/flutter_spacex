import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/constants/app_routes.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_bloc.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_events.dart';
import 'package:flutter_spacex/views/rockets/bloc/rockets_state.dart';
import 'package:flutter_spacex/views/rockets/widgets/rocket_tile_widget.dart';
import 'package:flutter_spacex/widgets/default_app_bar.dart';
import 'package:go_router/go_router.dart';

class Rockets extends StatelessWidget {
  const Rockets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsBloc, RocketsState>(builder: (context, state) {
      if (state.viewState == RocketsViewState.notLoaded) {
        context.read<RocketsBloc>().add(GetRockets());
      }
      return Scaffold(
          appBar: const DefaultAppBar(title: 'Rockets'),
          backgroundColor: const Color(UiColors.palette5),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .75),
            scrollDirection: Axis.vertical,
            itemCount: state.rockets.isEmpty
                ? state.rocketsSkeletonCount
                : state.rockets.length,
            itemBuilder: (context, index) {
              RocketModel? rocket =
                  state.rockets.isEmpty ? null : state.rockets[index];
              return GestureDetector(
                onTap: () {
                  if (rocket != null) {
                    context.go('${AppRoutes.rockets}/${AppRoutes.rocketDetail}',
                        extra: rocket);
                  }
                },
                child: RocketTileWidget(rocket: rocket),
              );
            },
          ));
    });
  }
}
