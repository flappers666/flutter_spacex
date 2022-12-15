import 'package:json_annotation/json_annotation.dart';

part 'rocket_mass.g.dart';

@JsonSerializable()
class RocketMass {
  double kg;
  double lb;
  RocketMass(this.kg, this.lb);

  static RocketMass fromJson(Map<String, dynamic> json) {
    return _$RocketMassFromJson(json);
  }
  Map<String, dynamic> toJson() => _$RocketMassToJson(this);
}