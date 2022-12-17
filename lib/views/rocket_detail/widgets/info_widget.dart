import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';

enum InfoPosition { left, right }

class InfoWidget extends StatelessWidget {
  final double columnWidth;
  final String headerText;
  final List<String> infoTexts;
  final InfoPosition position;

  const InfoWidget(
      {required this.columnWidth,
      required this.headerText,
      required this.infoTexts,
      required this.position,
      super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (position == InfoPosition.right) SizedBox(width: columnWidth),
            if (position == InfoPosition.right)
              SizedBox(
                width: columnWidth,
                child: Center(child: _HotSpot(columnWidth, InfoPosition.right)),
              ),
            SizedBox(
              width: columnWidth,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(UiColors.background),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                        color: const Color(UiColors.contrastingLight))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          headerText,
                          textAlign: TextAlign.center,
                          style: TextStyles.heading(fontSize: 14),
                        ),
                      ),
                      for (var info in infoTexts)
                        Text(
                          info,
                          textAlign: TextAlign.center,
                          style: TextStyles.body(fontSize: 12),
                        ),
                    ]),
              ),
            ),
            if (position == InfoPosition.left)
              SizedBox(
                width: columnWidth,
                child: Center(child: _HotSpot(columnWidth, InfoPosition.left)),
              ),
            if (position == InfoPosition.left) SizedBox(width: columnWidth),
          ],
        ),
      );
}

class _HotSpot extends StatelessWidget {
  final double columnWidth;
  final InfoPosition position;
  const _HotSpot(this.columnWidth, this.position);
  @override
  Widget build(BuildContext context) => Container(
        margin: position == InfoPosition.right
            ? EdgeInsets.only(left: columnWidth * .75)
            : EdgeInsets.only(right: columnWidth * .75),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.red, Colors.red.shade200.withAlpha(0)],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(360))),
      );
}
