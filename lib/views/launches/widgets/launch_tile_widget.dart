import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/widgets/launch_patch.dart';
import 'package:shimmer/shimmer.dart';

import 'calendar_icon_widget.dart';

class LaunchTileWidget extends StatelessWidget {
  final LaunchModel? launch;
  final double _height = 80;

  const LaunchTileWidget({super.key, required this.launch});

  @override
  Widget build(BuildContext context) => launch == null
      ? Column(children: [
          Shimmer.fromColors(
              baseColor: const Color(UiColors.palette5),
              highlightColor: const Color(UiColors.palette7),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                height: _height,
                color: Colors.white,
              ))
        ])
      : Column(children: [
          Container(
            height: _height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(.8, 0),
                colors: <Color>[
                  Color(UiColors.palette5),
                  Color(UiColors.palette6)
                ],
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  LaunchPatch(
                    height: _height - 20,
                    patch: launch?.links.patch,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No. ${launch!.flightNumber.toString()}',
                              style:
                                  TextStyles.body(fontWeight: FontWeight.bold)),
                          Text(launch!.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.body(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ]),
                  ),
                  const SizedBox(width: 10),
                  CalenderIconWidget(
                      day: launch!.dayFromDate,
                      month: launch!.monthFromDate.toString().toUpperCase()),
                  const SizedBox(width: 20)
                ]),
          ),
          const Divider(
            height: 0,
            thickness: 2,
            color: Color(UiColors.palette3),
          ),
        ]);
}
