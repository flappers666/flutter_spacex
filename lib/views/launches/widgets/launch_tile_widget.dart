import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'calendar_icon_widget.dart';

class LaunchTileWidget extends StatelessWidget {
  final LaunchModel? launch;
  final String patchUrl;
  final double _height = 80;

  const LaunchTileWidget({
    super.key,
    required this.launch,
    required this.patchUrl,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(.8, 0),
            colors: <Color>[Color(UiColors.palette5), Color(UiColors.palette6)],
          ),
        ),
        child: launch == null
            ? Column(children: [
                Shimmer.fromColors(
                    baseColor: const Color(UiColors.palette5),
                    highlightColor: const Color(UiColors.palette7),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      height: 80,
                      color: Colors.white,
                    ))
              ])
            : Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: _height,
                      child: Image(
                        fit: BoxFit.fitHeight,
                        height: _height,
                        width: 80,
                        image: patchUrl.isEmpty
                            ? const AssetImage(
                                    'assets/images/patch_default.png')
                                as ImageProvider
                            : NetworkImage(patchUrl),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No. ${launch!.flightNumber.toString()}',
                            style: const TextStyle(
                              fontFamily: UiFonts.textFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Color(UiColors.contrastingLight),
                            ),
                          ),
                          Text(
                            launch!.name,
                            style: const TextStyle(
                              fontFamily: UiFonts.textFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(UiColors.contrastingLight),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CalenderIconWidget(
                              day: launch!.dayFromDate,
                              month: launch!.monthFromDate
                                  .toString()
                                  .toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                ]),
                const Divider(
                  height: 0,
                  thickness: 2,
                  color: Color(UiColors.palette3),
                ),
              ]),
      );
}
