// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Projects _$ProjectsFromJson(Map<String, dynamic> json) => _Projects(
  id: json['id'] as String?,
  name: Map<String, String>.from(json['name'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  link: json['link'] as String,
  imageUrl: json['image_url'] as String,
  apkUrl: json['apk_url'] as String?,
);

Map<String, dynamic> _$ProjectsToJson(_Projects instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'link': instance.link,
  'image_url': instance.imageUrl,
  'apk_url': instance.apkUrl,
};
