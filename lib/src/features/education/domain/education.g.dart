// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Education _$EducationFromJson(Map<String, dynamic> json) => _Education(
  id: json['id'] as String?,
  name: Map<String, String>.from(json['name'] as Map),
  title: Map<String, String>.from(json['title'] as Map),
  instructor: Map<String, String>.from(json['instructor'] as Map),
  duration: Map<String, String>.from(json['duration'] as Map),
  skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
  imageUrl: json['image_url'] as String,
  link: json['link'] as String,
  completionDate:
      json['completion_date'] == null
          ? null
          : DateTime.parse(json['completion_date'] as String),
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$EducationToJson(_Education instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'instructor': instance.instructor,
      'duration': instance.duration,
      'skills': instance.skills,
      'image_url': instance.imageUrl,
      'link': instance.link,
      'completion_date': instance.completionDate?.toIso8601String(),
      'order': instance.order,
    };
