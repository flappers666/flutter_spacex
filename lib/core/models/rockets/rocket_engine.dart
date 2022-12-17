import 'package:json_annotation/json_annotation.dart';

part 'rocket_engine.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class RocketEngine {
  int number;
  String type;
  String version;
  @JsonKey(name: 'propellant_1')
  String propellant1;
  @JsonKey(name: 'propellant_2')
  String propellant2;
  double thrustToWeight;

  RocketEngine(this.number, this.type, this.version, this.propellant1,
      this.propellant2, this.thrustToWeight);

  static RocketEngine fromJson(Map<String, dynamic> json) {
    return _$RocketEngineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RocketEngineToJson(this);
}
