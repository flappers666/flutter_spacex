// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketModel _$RocketModelFromJson(Map<String, dynamic> json) => RocketModel(
      json['name'] as String,
      json['type'] as String,
      json['active'] as bool,
      json['stages'] as int,
      json['boosters'] as int,
      (json['cost_per_launch'] as num).toDouble(),
      json['success_rate_pct'] as int,
      DateTime.parse(json['first_flight'] as String),
      json['country'] as String,
      json['company'] as String,
      json['wikipedia'] as String,
      json['description'] as String,
      json['id'] as String,
      RocketHeight.fromJson(json['height'] as Map<String, dynamic>),
      RocketDiameter.fromJson(json['diameter'] as Map<String, dynamic>),
      RocketMass.fromJson(json['mass'] as Map<String, dynamic>),
      (json['flickr_images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RocketModelToJson(RocketModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'cost_per_launch': instance.costPerLaunch,
      'success_rate_pct': instance.successRatePct,
      'first_flight': instance.firstFlight.toIso8601String(),
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
      'height': instance.height.toJson(),
      'diameter': instance.diameter.toJson(),
      'mass': instance.mass.toJson(),
      'flickr_images': instance.flickrImages,
    };
