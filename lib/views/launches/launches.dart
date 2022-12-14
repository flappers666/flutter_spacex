import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/app_routes.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_bloc.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_event.dart';
import 'package:flutter_spacex/views/launches/bloc/launches_state.dart';
import 'package:flutter_spacex/views/launches/widgets/launch_tile_widget.dart';
import 'package:go_router/go_router.dart';

class Launches extends StatelessWidget {
  const Launches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesBloc, LaunchesState>(builder: (context, state) {
      if (state.viewState == LaunchViewState.notLoaded) {
        context.read<LaunchesBloc>().add(GetLaunches());
      }
      return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: const Color(UiColors.background),
            title: Text('Launches', style: TextStyles.heading()),
          ),
          body: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.launches.isEmpty
                  ? state.launchesSkeletonCount
                  : state.launches.length,
              itemBuilder: (context, index) {
                LaunchModel? launch =
                    state.launches.isEmpty ? null : state.launches[index];
                return GestureDetector(
                  onTap: () {
                    if (launch != null) {
                      context.go(
                          '${AppRoutes.launches}/${AppRoutes.launchDetail}',
                          extra: launch);
                    }
                  },
                  child: LaunchTileWidget(launch: launch),
                );
              }));
    });
  }
}
