// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_diameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketDiameter _$RocketDiameterFromJson(Map<String, dynamic> json) =>
    RocketDiameter(
      (json['meters'] as num).toDouble(),
      (json['feet'] as num).toDouble(),
    );

Map<String, dynamic> _$RocketDiameterToJson(RocketDiameter instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };
