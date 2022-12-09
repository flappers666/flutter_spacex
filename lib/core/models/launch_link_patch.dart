import 'package:json_annotation/json_annotation.dart';

part 'launch_link_patch.g.dart';

@JsonSerializable()
class LaunchLinkPatch {
  String? small;
  String? large;
  LaunchLinkPatch(this.small, this.large);

  static LaunchLinkPatch fromJson(Map<String, dynamic> json) {
    return _$LaunchLinkPatchFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LaunchLinkPatchToJson(this);
}