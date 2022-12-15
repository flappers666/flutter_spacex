import 'package:flutter_spacex/core/models/launches/launch_link_flickr.dart';
import 'package:flutter_spacex/core/models/launches/launch_link_patch.dart';
import 'package:flutter_spacex/core/models/launches/launch_link_reddit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_links.g.dart';

@JsonSerializable()
class LaunchLinks {
  LaunchLinkPatch patch;
  LaunchLinkReddit reddit;
  LaunchLinkFlickr flickr;
  LaunchLinks(this.patch, this.reddit, this.flickr);

  static LaunchLinks fromJson(Map<String, dynamic> json) {
    return _$LaunchLinksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LaunchLinksToJson(this);
}
