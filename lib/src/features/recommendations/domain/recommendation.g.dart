// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    _Recommendation(
      id: json['id'] as String?,
      authorName: json['author_name'] as String,
      authorEmail: json['author_email'] as String,
      authorPhotoUrl: json['author_photo_url'] as String?,
      content: json['content'] as String,
      relationship: json['relationship'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      approved: json['approved'] as bool? ?? false,
      verified: json['verified'] as bool? ?? false,
      pinned: json['pinned'] as bool? ?? false,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RecommendationToJson(_Recommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_name': instance.authorName,
      'author_email': instance.authorEmail,
      'author_photo_url': instance.authorPhotoUrl,
      'content': instance.content,
      'relationship': instance.relationship,
      'created_at': instance.createdAt.toIso8601String(),
      'approved': instance.approved,
      'verified': instance.verified,
      'pinned': instance.pinned,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
    };
