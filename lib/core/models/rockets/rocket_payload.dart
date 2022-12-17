import 'package:json_annotation/json_annotation.dart';

part 'rocket_payload.g.dart';

@JsonSerializable()
class RocketPayload {
  String id;
  String name;
  int kg;
  int lb;

  RocketPayload(
    this.id,
    this.name,
    this.kg,
    this.lb,
  );

  static RocketPayload fromJson(Map<String, dynamic> json) {
    return _$RocketPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RocketPayloadToJson(this);
}
