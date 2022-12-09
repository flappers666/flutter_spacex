// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchModel _$LaunchModelFromJson(Map<String, dynamic> json) {
  return LaunchModel(
    LaunchLinks.fromJson(json['links'] as Map<String, dynamic>),
    json['id'] as String,
    json['flight_number'] as int,
    json['name'] as String,
    json['date_unix'] as int,
    json['upcoming'] as bool,
    json['details'] as String?,
  );
}

Map<String, dynamic> _$LaunchModelToJson(LaunchModel instance) =>
    <String, dynamic>{
      'links': instance.links.toJson(),
      'id': instance.id,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_unix': instance.dateUnix,
      'upcoming': instance.upcoming,
      'details': instance.details,
    };
