// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchLinks _$LaunchLinksFromJson(Map<String, dynamic> json) {
  return LaunchLinks(
    LaunchLinkPatch.fromJson(json['patch'] as Map<String, dynamic>),
    LaunchLinkReddit.fromJson(json['reddit'] as Map<String, dynamic>),
    LaunchLinkFlickr.fromJson(json['flickr'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LaunchLinksToJson(LaunchLinks instance) =>
    <String, dynamic>{
      'patch': instance.patch,
      'reddit': instance.reddit,
      'flickr': instance.flickr,
    };
