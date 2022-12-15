import 'package:json_annotation/json_annotation.dart';

part 'rocket_diameter.g.dart';

@JsonSerializable()
class RocketDiameter {
  double meters;
  double feet;
  RocketDiameter(this.meters, this.feet);

  static RocketDiameter fromJson(Map<String, dynamic> json) {
    return _$RocketDiameterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RocketDiameterToJson(this);
}