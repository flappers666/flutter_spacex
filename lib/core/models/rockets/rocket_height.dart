import 'package:json_annotation/json_annotation.dart';

part 'rocket_height.g.dart';

@JsonSerializable()
class RocketHeight {
  double meters;
  double feet;
  RocketHeight(this.meters, this.feet);

  static RocketHeight fromJson(Map<String, dynamic> json) {
    return _$RocketHeightFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RocketHeightToJson(this);
}