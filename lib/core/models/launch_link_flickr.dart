import 'package:json_annotation/json_annotation.dart';

part 'launch_link_flickr.g.dart';

@JsonSerializable()
class LaunchLinkFlickr {
  List<String> small;
  List<String> original;
  LaunchLinkFlickr(this.small, this.original);

  static LaunchLinkFlickr fromJson(Map<String, dynamic> json) {
    return _$LaunchLinkFlickrFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LaunchLinkFlickrToJson(this);
}