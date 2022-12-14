import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/app.dart';
import 'package:flutter_spacex/core/utilities/logger.dart';

void main() {
  Logger.initialise(isRelease: false);
  runApp(App());
}
