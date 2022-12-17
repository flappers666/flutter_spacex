import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_model.dart';
import 'package:flutter_spacex/views/constants/text_styles.dart';
import 'package:flutter_spacex/views/constants/ui_colors.dart';
import 'package:shimmer/shimmer.dart';

class RocketTileWidget extends StatelessWidget {
  final RocketModel? rocket;

  const RocketTileWidget({required this.rocket, super.key});

  final double _height = 300;
  final double _borderRadius = 4;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: const Color(UiColors.palette5),
          border: Border.all(color: const Color(UiColors.palette10), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius))),
      child: rocket == null
          ? Shimmer.fromColors(
              baseColor: const Color(UiColors.palette5),
              highlightColor: const Color(UiColors.palette7),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                height: _height,
                color: Colors.white,
              ))
          : Stack(fit: StackFit.expand, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  child: CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      imageUrl: rocket!.flickrImages.first)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(_borderRadius)),
                          ),
                          height: 25,
                          child: Center(
                            child: Text(
                              rocket!.name,
                              style: TextStyles.heading(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]));
  // margin: const EdgeInsets.all(10),
  // decoration: const BoxDecoration(
  //     borderRadius: BorderRadius.all(Radius.circular(5)),
  //     color: Color(UiColors.palette5)),
  // child: rocket != null
  //     ? Column(children: [
  //         const SizedBox(height: 4),
  //         Text(
  //           rocket!.name,
  //           style: TextStyles.heading(),
  //         ),
  //         const SizedBox(height: 4),
  //         Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 8),
  //             child: rocket!.flickrImages.isEmpty
  //                 ? Container()
  //                 : ClipRRect(
  //                     borderRadius: BorderRadius.circular(4),
  //                     child: CachedNetworkImage(
  //                         fit: BoxFit.fill,
  //                         imageUrl: rocket!.flickrImages[0])))
  //       ])
  // : Container());
}
