import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';

class TextStyles {
  static TextStyle heading(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        fontFamily: UiFonts.headerFont,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? const Color(UiColors.contrastingLight),
      );

  static TextStyle body(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: UiFonts.headerFont,
          fontSize: fontSize ?? 10,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? const Color(UiColors.contrastingLight));
}
