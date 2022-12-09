import 'package:json_annotation/json_annotation.dart';

part 'launch_link_reddit.g.dart';

@JsonSerializable()
class LaunchLinkReddit {
  String? campaign;
  String? launch;
  String? media;
  String? recovery;
  LaunchLinkReddit(this.campaign, this.launch, this.media, this.recovery);

  static LaunchLinkReddit fromJson(Map<String, dynamic> json) {
    return _$LaunchLinkRedditFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LaunchLinkRedditToJson(this);
}