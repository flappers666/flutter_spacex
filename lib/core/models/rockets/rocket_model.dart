import 'package:flutter_spacex/core/models/rockets/rocket_diameter.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_height.dart';
import 'package:flutter_spacex/core/models/rockets/rocket_mass.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class RocketModel {
  String name;
  String type;
  bool active;
  int stages;
  int boosters;
  double costPerLaunch;
  int successRatePct;
  DateTime firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;
  RocketHeight height;
  RocketDiameter diameter;
  RocketMass mass;
  List<String> flickrImages;

  RocketModel(
      this.name,
      this.type,
      this.active,
      this.stages,
      this.boosters,
      this.costPerLaunch,
      this.successRatePct,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id,
      this.height,
      this.diameter,
      this.mass,
      this.flickrImages);

  static RocketModel fromJson(Map<String, dynamic> json) {
    return _$RocketModelFromJson(json);
  }
}
