import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/countdown_time_model.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:flutter_spacex/views/constants/ui_fonts.dart';
import 'package:flutter_spacex/widgets/flip_tile_widget.dart';

class CountdownClockWidget extends StatefulWidget {
  const CountdownClockWidget(this.unixDate, {super.key});
  final int unixDate;

  @override
  State<CountdownClockWidget> createState() => _CountdownClockWidgetState();
}

class _CountdownClockWidgetState extends State<CountdownClockWidget> {
  final double _tileWidth = 80;
  final double _tileHeight = 60;
  final double _fontSize = 30;

  Timer? _refreshTimer;
  CountDownTimeModel countDownTimeModelBase =
      CountDownTimeModel(days: 0, hours: 0, mins: 0, secs: 0);
  CountDownTimeModel countdownModel =
      CountDownTimeModel(days: 0, hours: 0, mins: 0, secs: 0);

  void getRemainingTime() {
    countDownTimeModelBase.days = countdownModel.days;
    countDownTimeModelBase.hours = countdownModel.hours;
    countDownTimeModelBase.mins = countdownModel.mins;
    countDownTimeModelBase.secs = countdownModel.secs;

    var now = DateTime.now();
    var date = DateTime.fromMillisecondsSinceEpoch(widget.unixDate * 1000);
    var diff = date.difference(now);

    if (diff.inSeconds > 0) {
      countdownModel.days = diff.inDays;
      countdownModel.hours = diff.inHours % 24;
      countdownModel.mins = diff.inMinutes % 60;
      countdownModel.secs = diff.inSeconds % 60;
    }
  }

  void setRemainingTime() {
    getRemainingTime();
    setState(() {});
  }

  void startRefreshTimer() {
    setRemainingTime();
    _refreshTimer = Timer.periodic(
        const Duration(seconds: 1), (timer) => setRemainingTime());
  }

  @override
  initState() {
    super.initState();
    getRemainingTime();
    startRefreshTimer();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Widget flipTile(String labelText, bool animateOnStart, int displayValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(children: [
        Text(labelText.toUpperCase(),
            style: const TextStyle(
                fontSize: 12,
                fontFamily: UiFonts.textFont,
                fontWeight: FontWeight.bold,
                color: Color(UiColors.contrastingLight))),
        FlipTileWidget(
            animateOnStart: animateOnStart,
            displayValue: displayValue,
            width: _tileWidth,
            height: _tileHeight,
            fontSize: _fontSize),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        flipTile('Days', countDownTimeModelBase.days != countdownModel.days,
            countdownModel.days),
        flipTile('Hours', countDownTimeModelBase.hours != countdownModel.hours,
            countdownModel.hours),
        flipTile('Mins', countDownTimeModelBase.mins != countdownModel.mins,
            countdownModel.mins),
        flipTile('Secs', countDownTimeModelBase.secs != countdownModel.secs,
            countdownModel.secs),
      ],
    );
  }
}
