import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'dart:math' as math;

import 'package:flutter_spacex/views/constants/ui_fonts.dart';

class FlipTileWidget extends StatefulWidget {
  final bool animateOnStart;
  final double width;
  final double height;
  final double fontSize;
  final int displayValue;

  const FlipTileWidget(
      {super.key,
      required this.animateOnStart,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.displayValue});

  @override
  State<FlipTileWidget> createState() => _FlipTileWidgetState();
}

class _FlipTileWidgetState extends State<FlipTileWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animationTop;
  late final Animation _animationBottom;

  int time = 250;
  final double _startDrop = 0.0001;
  final double _endDrop = math.pi / 2;
  bool dropOne = false;

  String _nextValue = '';
  String _currentValue = '';

  void beginAnimating() {
    _currentValue = (widget.displayValue + 1).toString().padLeft(2, '0');
    _nextValue = widget.displayValue.toString().padLeft(2, '0');

    if (!widget.animateOnStart) {
      _currentValue = _nextValue;
      return;
    }
    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: time));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!dropOne) {
          dropOne = true;
          _animationController.reset();
          _animationController.forward();
        } else {
          dropOne = false;
          _currentValue = _nextValue;
          _animationController.reset();
        }
      }
    });

    _animationTop = Tween<double>(begin: _startDrop, end: _endDrop)
        .animate(_animationController);

    _animationBottom = Tween<double>(begin: _endDrop, end: _startDrop)
        .animate(_animationController);

    _animationBottom.addListener(() => {setState(() {})});

    beginAnimating();
  }

  @override
  void didUpdateWidget(covariant FlipTileWidget oldWidget) {
    beginAnimating();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget backgroundContainer() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  TextStyle get textStyle => TextStyle(
      fontSize: widget.fontSize,
      fontFamily: UiFonts.textFont,
      fontWeight: FontWeight.bold,
      color: const Color(UiColors.contrastingLight));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          ClipRect(
              child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Stack(
              children: [
                backgroundContainer(),
                Positioned(
                  width: widget.width,
                  height: widget.height,
                  child: Center(
                    child: Text(
                      _nextValue,
                      style: textStyle,
                    ),
                  ),
                )
              ],
            ),
          )),
          //Top flip half
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, .003)
              ..rotateX(!dropOne ? _animationTop.value : _endDrop),
            alignment: Alignment.bottomCenter,
            child: ClipRect(
                child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: Stack(
                children: [
                  backgroundContainer(),
                  Positioned(
                    width: widget.width,
                    height: widget.height,
                    child: Center(
                      child: Text(
                        _currentValue,
                        style: textStyle,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 2.0),
        ),
        Stack(children: [
          ClipRect(
              child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Stack(
              children: [
                backgroundContainer(),
                Positioned(
                  width: widget.width,
                  height: widget.height,
                  child: Center(
                    child: Text(
                      _currentValue,
                      style: textStyle,
                    ),
                  ),
                )
              ],
            ),
          )),
          //Bottom Flip Half
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, -.003)
              ..rotateX(!dropOne ? _endDrop : _animationBottom.value),
            alignment: Alignment.topCenter,
            child: ClipRect(
                child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.5,
              child: Stack(
                children: [
                  backgroundContainer(),
                  Positioned(
                    width: widget.width,
                    height: widget.height,
                    child: Center(
                      child: Text(
                        _nextValue.toString(),
                        style: textStyle,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ]),
      ],
    );
  }
}
