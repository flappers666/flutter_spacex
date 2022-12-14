import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';

class CalenderIconWidget extends StatelessWidget {
  final String day;
  final String month;

  const CalenderIconWidget({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 15,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: Colors.black,
          ),
          child: Center(
              child: Text(month,
                  style: TextStyles.body(fontWeight: FontWeight.bold))),
        ),
        Container(
          height: 25,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            color: Color(UiColors.contrastingLight),
          ),
          child: Center(
            child: Text(day,
                style: TextStyles.body(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(UiColors.contrastingDark))),
          ),
        ),
      ]);
}
