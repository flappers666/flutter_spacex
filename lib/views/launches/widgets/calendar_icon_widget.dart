import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';

class CalenderIconWidget extends StatelessWidget {
  final String day;
  final String month;

  const CalenderIconWidget({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) => Column(children: [
        Container(
          height: 15,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: Color(0xfff003d5c),
          ),
          child: Center(
              child: Text(
            month,
            style: const TextStyle(
              fontFamily: UiFonts.textFont,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Color(UiColors.contrastingLight),
            ),
          )),
        ),
        Container(
          height: 25,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              day,
              style: const TextStyle(
                fontFamily: UiFonts.textFont,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(UiColors.contrastingDark),
              ),
            ),
          ),
        ),
      ]);
}
