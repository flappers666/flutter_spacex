import 'package:flutter_spacex/core/models/launches/launch_links.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LaunchModel {
  LaunchLinks links;
  String id;
  int flightNumber;
  String name;
  int dateUnix;
  @JsonKey(defaultValue: false)
  bool upcoming;
  String? details;
  @JsonKey(defaultValue: false)
  bool success;

  LaunchModel(this.links, this.id, this.flightNumber, this.name, this.dateUnix,
      this.upcoming, this.details, this.success);

  static LaunchModel fromJson(Map<String, dynamic> json) {
    return _$LaunchModelFromJson(json);
  }

  //Added as there were no upcoming laucnhed as of dec 2022 :D
  int get lauchDateManipulated => dateUnix + (60 * 60 * 24 * 60);

  @JsonKey(ignore: true)
  String get formattedDate => DateFormat('dd/MM/yy')
      .format(DateTime.fromMillisecondsSinceEpoch(lauchDateManipulated * 1000));

  @JsonKey(ignore: true)
  NumberFormat formatter = NumberFormat("00");
  String get dayFromDate {
    var day = double.parse(DateFormat('d').format(
        DateTime.fromMillisecondsSinceEpoch(lauchDateManipulated * 1000)));
    return formatter.format(day);
  }

  @JsonKey(ignore: true)
  String get monthFromDate => DateFormat('MMM')
      .format(DateTime.fromMillisecondsSinceEpoch(lauchDateManipulated * 1000));
}
