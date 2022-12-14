import 'package:flutter/material.dart';
import 'package:flutter_spacex/core/launches/model/launch_link_patch.dart';

class LaunchPatch extends StatelessWidget {
  final double height;
  final LaunchLinkPatch? patch;

  const LaunchPatch({super.key, required this.height, required this.patch});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: height),
        child: Image(
          fit: BoxFit.contain,
          image: patch?.large == null
              ? const AssetImage('assets/images/patch_default.png')
                  as ImageProvider
              : NetworkImage(patch!.large!),
        ));
  }
}
