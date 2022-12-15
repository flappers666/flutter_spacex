// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_height.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketHeight _$RocketHeightFromJson(Map<String, dynamic> json) => RocketHeight(
      (json['meters'] as num).toDouble(),
      (json['feet'] as num).toDouble(),
    );

Map<String, dynamic> _$RocketHeightToJson(RocketHeight instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };
