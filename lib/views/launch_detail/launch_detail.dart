import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:flutter_spacex/widgets/countdown_clock_widget.dart';
import 'package:go_router/go_router.dart';

class LaunchDetail extends StatelessWidget {
  final LaunchModel launchDetail;
  const LaunchDetail({super.key, required this.launchDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: const Color(UiColors.palette5),
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            iconSize: 30,
            onPressed: () => GoRouter.of(context).pop()),
        title: Text(
          launchDetail.name,
          style: const TextStyle(
            fontFamily: UiFonts.headerFont,
            fontWeight: FontWeight.bold,
            color: Color(UiColors.contrastingLight),
          ),
        ),
      ),
      body: Container(
        color: const Color(UiColors.palette5),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CountdownClockWidget(launchDetail.dateUnix),
            ),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Text(
                launchDetail.details ?? 'Details',
                style: const TextStyle(
                  color: Color(UiColors.contrastingLight),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
