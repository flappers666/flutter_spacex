import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/launches/launch_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';

class LaunchDetailIcons extends StatelessWidget {
  final LaunchModel launchDetail;
  const LaunchDetailIcons(this.launchDetail, {Key? key}) : super(key: key);

  List<Widget> getIcons() {
    List<Widget> icons = [];

    if (launchDetail.upcoming) {
      icons.add(const _LaunchDetailIconRow(
          Icons.upcoming_outlined, 'Launch Upcoming'));
    } else {
      if (!launchDetail.success) {
        icons.add(
            const _LaunchDetailIconRow(Icons.crisis_alert, 'Launch Failed'));
      } else {
        icons.add(
            const _LaunchDetailIconRow(Icons.rocket_launch, 'Launch Success'));
      }
    }
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...getIcons()],
    );
  }
}

class _LaunchDetailIconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _LaunchDetailIconRow(this.icon, this.text);
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, color: const Color(UiColors.contrastingLight)),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyles.body(fontSize: 14),
          )
        ],
      );
}
