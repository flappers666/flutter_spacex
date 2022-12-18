import 'package:flutter/material.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';

enum InfoMarkerPosition { left, right }

class InfoRowWidget extends StatefulWidget {
  final InfoMarkerPosition position;
  final double columnWidth;
  final void Function()? onTap;
  const InfoRowWidget(
      {required this.position,
      required this.columnWidth,
      required this.onTap,
      super.key});

  @override
  State<InfoRowWidget> createState() => _InfoRowWidgetState();
}

class _InfoRowWidgetState extends State<InfoRowWidget> {
  @override
  Widget build(BuildContext context) {
    var position = widget.position;
    var columnWidth = widget.columnWidth;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (position == InfoMarkerPosition.right)
            SizedBox(width: columnWidth),
          if (position == InfoMarkerPosition.right)
            SizedBox(
              width: columnWidth,
              child: Center(
                  child: GestureDetector(
                      onTap: widget.onTap,
                      child: _HotSpot(columnWidth, InfoMarkerPosition.right))),
            ),
          SizedBox(
            width: columnWidth,
          ),
          if (position == InfoMarkerPosition.left)
            SizedBox(
              width: columnWidth,
              child: Center(
                child: GestureDetector(
                    onTap: widget.onTap,
                    child: _HotSpot(columnWidth, InfoMarkerPosition.left)),
              ),
            ),
          if (position == InfoMarkerPosition.left) SizedBox(width: columnWidth),
        ],
      ),
    );
  }
}

class _HotSpot extends StatefulWidget {
  final double columnWidth;
  final InfoMarkerPosition position;
  const _HotSpot(this.columnWidth, this.position);

  @override
  State<_HotSpot> createState() => _HotSpotState();
}

class _HotSpotState extends State<_HotSpot> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<double>? _tween;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..forward()
      ..repeat(reverse: true);

    _tween = _animController!.drive(CurveTween(curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var position = widget.position;
    var columnWidth = widget.columnWidth;
    return AnimatedBuilder(
        animation: _animController!,
        builder: (context, child) {
          return Container(
            margin: position == InfoMarkerPosition.right
                ? EdgeInsets.only(left: columnWidth * .75)
                : EdgeInsets.only(right: columnWidth * .75),
            width: 25 + (5 * _tween!.value),
            height: 25 + (5 * _tween!.value),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.red.shade200.withAlpha(0)],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(360)),
                border:
                    Border.all(color: const Color(UiColors.contrastingLight))),
          );
        });
  }
}
