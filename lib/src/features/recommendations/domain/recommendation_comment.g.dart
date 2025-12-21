// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendationComment _$RecommendationCommentFromJson(
  Map<String, dynamic> json,
) => _RecommendationComment(
  id: json['id'] as String?,
  authorName: json['author_name'] as String,
  authorEmail: json['author_email'] as String,
  authorPhotoUrl: json['author_photo_url'] as String?,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$RecommendationCommentToJson(
  _RecommendationComment instance,
) => <String, dynamic>{
  'id': instance.id,
  'author_name': instance.authorName,
  'author_email': instance.authorEmail,
  'author_photo_url': instance.authorPhotoUrl,
  'content': instance.content,
  'created_at': instance.createdAt.toIso8601String(),
};
