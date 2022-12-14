import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spacex/core/launches/model/launch_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:flutter_spacex/views/launch_detail/widgets/launch_detail_icons.dart';
import 'package:flutter_spacex/widgets/countdown_clock_widget.dart';
import 'package:flutter_spacex/widgets/launch_patch.dart';
import 'package:go_router/go_router.dart';

class LaunchDetail extends StatelessWidget {
  final LaunchModel launchDetail;
  const LaunchDetail({super.key, required this.launchDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: const Color(UiColors.background),
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            iconSize: 30,
            onPressed: () => GoRouter.of(context).pop()),
        title: Text(
          launchDetail.name,
          style: TextStyles.heading(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.5),
            radius: 0.8,
            colors: <Color>[
              Color(UiColors.palette10),
              Color(UiColors.contrastingDark),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            const SizedBox(height: 20),
            Center(
              child: LaunchPatch(height: 150, patch: launchDetail.links.patch),
            ),
            const SizedBox(height: 20),
            CountdownClockWidget(launchDetail.lauchDateManipulated),
            const SizedBox(height: 40),
            LaunchDetailIcons(launchDetail),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.info,
                        color: Color(
                          UiColors.contrastingLight,
                        )),
                  ],
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Text(launchDetail.details ?? 'No details...',
                        textAlign: TextAlign.justify,
                        style: TextStyles.body(fontSize: 14)),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
