import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_comment.freezed.dart';
part 'recommendation_comment.g.dart';

@freezed
abstract class RecommendationComment with _$RecommendationComment {
  const factory RecommendationComment({
    String? id,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_email') required String authorEmail,
    @JsonKey(name: 'author_photo_url') String? authorPhotoUrl,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _RecommendationComment;

  factory RecommendationComment.fromJson(Map<String, dynamic> json) =>
      _$RecommendationCommentFromJson(json);
}

extension RecommendationCommentFirestore on RecommendationComment {
  static RecommendationComment fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return RecommendationComment(
      id: doc.id,
      authorName: data['author_name'] ?? '',
      authorEmail: data['author_email'] ?? '',
      authorPhotoUrl: data['author_photo_url'],
      content: data['content'] ?? '',
      createdAt: (data['created_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'author_name': authorName,
      'author_email': authorEmail,
      'author_photo_url': authorPhotoUrl,
      'content': content,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }
}
