// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketPayload _$RocketPayloadFromJson(Map<String, dynamic> json) =>
    RocketPayload(
      json['id'] as String,
      json['name'] as String,
      json['kg'] as int,
      json['lb'] as int,
    );

Map<String, dynamic> _$RocketPayloadToJson(RocketPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kg': instance.kg,
      'lb': instance.lb,
    };
