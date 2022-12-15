// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_mass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketMass _$RocketMassFromJson(Map<String, dynamic> json) => RocketMass(
      (json['kg'] as num).toDouble(),
      (json['lb'] as num).toDouble(),
    );

Map<String, dynamic> _$RocketMassToJson(RocketMass instance) =>
    <String, dynamic>{
      'kg': instance.kg,
      'lb': instance.lb,
    };
