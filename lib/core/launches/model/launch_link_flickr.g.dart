// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_link_flickr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchLinkFlickr _$LaunchLinkFlickrFromJson(Map<String, dynamic> json) =>
    LaunchLinkFlickr(
      (json['small'] as List<dynamic>).map((e) => e as String).toList(),
      (json['original'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LaunchLinkFlickrToJson(LaunchLinkFlickr instance) =>
    <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };
