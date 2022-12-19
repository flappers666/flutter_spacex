import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_bloc.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_event.dart';
import 'package:flutter_spacex/views/rocket_detail/bloc/rocket_detail_state.dart';
import 'package:flutter_spacex/views/rocket_detail/widgets/info_row_widget.dart';
import 'package:flutter_spacex/widgets/default_app_bar.dart';
import 'package:go_router/go_router.dart';

class RocketDetail extends StatelessWidget {
  final RocketModel rocket;
  const RocketDetail({required this.rocket, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double colWidth = screenWidth * .3;
    double descriptionHeight = screenHeight * .2;

    void infoMarkerTapped(int markerIndex) {
      context.read<RocketDetailBloc>().add(UpdateInfo(markerIndex));
    }

    return BlocBuilder<RocketDetailBloc, RocketDetailState>(
        builder: (context, state) {
      return Scaffold(
          appBar: DefaultAppBar(
              title: rocket.name, backFunc: () => GoRouter.of(context).pop()),
          body: Container(
              decoration: UiColors.defaultRadialGradient,
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Stack(fit: StackFit.expand, children: [
                    Center(child: Image.asset('assets/images/rocket.png')),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (int i = 1; i < 6; i++)
                            InfoRowWidget(
                                columnWidth: colWidth,
                                isSelected: state.infoTab == i,
                                position: i % 2 == 0
                                    ? InfoMarkerPosition.left
                                    : InfoMarkerPosition.right,
                                onTap: () => infoMarkerTapped(i)),
                        ]),
                  ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(UiColors.background),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: const Color(UiColors.contrastingLight))),
                    height: descriptionHeight,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            state.infoHeading,
                            style: TextStyles.heading(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          for (var t in state.infoTexts)
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    t,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.body(fontSize: 14),
                                  ),
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ])));
    });
  }
}
