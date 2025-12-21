import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation.freezed.dart';
part 'recommendation.g.dart';

@freezed
abstract class Recommendation with _$Recommendation {
  const factory Recommendation({
    String? id,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_email') required String authorEmail,
    @JsonKey(name: 'author_photo_url') String? authorPhotoUrl,
    required String content,
    required String relationship,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default(false) bool approved,
    @Default(false) bool verified,
    @Default(false) bool pinned,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

extension RecommendationFirestore on Recommendation {
  static Recommendation fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Recommendation(
      id: doc.id,
      authorName: data['author_name'] ?? '',
      authorEmail: data['author_email'] ?? '',
      authorPhotoUrl: data['author_photo_url'],
      content: data['content'] ?? '',
      relationship: data['relationship'] ?? '',
      createdAt: (data['created_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
      approved: data['approved'] ?? false,
      verified: data['verified'] ?? false,
      pinned: data['pinned'] ?? false,
      likesCount: data['likes_count'] ?? 0,
      commentsCount: data['comments_count'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'author_name': authorName,
      'author_email': authorEmail,
      'author_photo_url': authorPhotoUrl,
      'content': content,
      'relationship': relationship,
      'created_at': Timestamp.fromDate(createdAt),
      'approved': approved,
      'verified': verified,
      'pinned': pinned,
      'likes_count': likesCount,
      'comments_count': commentsCount,
    };
  }
}
