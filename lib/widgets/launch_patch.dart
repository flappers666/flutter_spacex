import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/models/launches/launch_link_patch.dart';

class LaunchPatch extends StatelessWidget {
  final double height;
  final LaunchLinkPatch? patch;

  const LaunchPatch({super.key, required this.height, required this.patch});

  Widget get defaultImage => const Image(
      fit: BoxFit.contain,
      image: AssetImage('assets/images/patch_default.png'));

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: height),
      child: patch?.large == null
          ? defaultImage
          : CachedNetworkImage(
              imageUrl: patch!.large!,
              placeholder: (context, url) => defaultImage),
    );
  }
}
