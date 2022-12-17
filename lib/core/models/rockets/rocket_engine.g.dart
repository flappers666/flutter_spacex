// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_engine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketEngine _$RocketEngineFromJson(Map<String, dynamic> json) => RocketEngine(
      json['number'] as int,
      json['type'] as String,
      json['version'] as String,
      json['propellant_1'] as String,
      json['propellant_2'] as String,
      (json['thrust_to_weight'] as num).toDouble(),
    );

Map<String, dynamic> _$RocketEngineToJson(RocketEngine instance) =>
    <String, dynamic>{
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'propellant_1': instance.propellant1,
      'propellant_2': instance.propellant2,
      'thrust_to_weight': instance.thrustToWeight,
    };
