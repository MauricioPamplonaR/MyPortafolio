import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation_comment.dart';

part 'recommendations_repository.g.dart';

class RecommendationsRepository {
  final FirebaseFirestore _db;

  RecommendationsRepository({FirebaseFirestore? db})
    : _db = db ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _recommendationsRef =>
      _db.collection('recommendations');

  // Get all approved recommendations (pinned first, then by date)
  Future<List<Recommendation>> getRecommendations() async {
    final snapshot =
        await _recommendationsRef
            .where('approved', isEqualTo: true)
            .orderBy('created_at', descending: true)
            .get();

    final recommendations =
        snapshot.docs
            .map((doc) => RecommendationFirestore.fromDoc(doc))
            .toList();

    // Ordenar: pinned primero, luego por fecha
    recommendations.sort((a, b) {
      if (a.pinned && !b.pinned) return -1;
      if (!a.pinned && b.pinned) return 1;
      return b.createdAt.compareTo(a.createdAt);
    });

    return recommendations;
  }

  // Get all recommendations (for admin)
  Future<List<Recommendation>> getAllRecommendations() async {
    final snapshot =
        await _recommendationsRef.orderBy('created_at', descending: true).get();

    return snapshot.docs
        .map((doc) => RecommendationFirestore.fromDoc(doc))
        .toList();
  }

  // Add a new recommendation
  Future<String> addRecommendation(Recommendation recommendation) async {
    final docRef = await _recommendationsRef.add(recommendation.toFirestore());
    return docRef.id;
  }

  // Toggle like on a recommendation
  Future<void> toggleLike(String recommendationId, String userId) async {
    final likeRef = _recommendationsRef
        .doc(recommendationId)
        .collection('likes')
        .doc(userId);
    final likeDoc = await likeRef.get();

    if (likeDoc.exists) {
      await likeRef.delete();
      return;
    }

    await likeRef.set({
      'recommendation_id': recommendationId,
      'user_id': userId,
      'created_at': Timestamp.now(),
    });
  }

  // Check if user has liked a recommendation
  Future<bool> hasUserLiked(String recommendationId, String userId) async {
    final likeRef = _recommendationsRef
        .doc(recommendationId)
        .collection('likes')
        .doc(userId);
    final doc = await likeRef.get();
    return doc.exists;
  }

  // Get likes count from the likes subcollection.
  Future<int> getLikesCount(String recommendationId) async {
    final snapshot =
        await _recommendationsRef
            .doc(recommendationId)
            .collection('likes')
            .count()
            .get();

    return snapshot.count ?? 0;
  }

  // Get comments count from the comments subcollection.
  Future<int> getCommentsCount(String recommendationId) async {
    final snapshot =
        await _recommendationsRef
            .doc(recommendationId)
            .collection('comments')
            .count()
            .get();

    return snapshot.count ?? 0;
  }

  // Get comments for a recommendation
  Future<List<RecommendationComment>> getComments(
    String recommendationId,
  ) async {
    final snapshot =
        await _recommendationsRef
            .doc(recommendationId)
            .collection('comments')
            .orderBy('created_at', descending: false)
            .get();

    return snapshot.docs
        .map((doc) => RecommendationCommentFirestore.fromDoc(doc))
        .toList();
  }

  // Add a comment to a recommendation
  Future<void> addComment(
    String recommendationId,
    RecommendationComment comment,
  ) async {
    await _recommendationsRef
        .doc(recommendationId)
        .collection('comments')
        .add(comment.toFirestore());
  }

  // Approve a recommendation (admin only)
  Future<void> approveRecommendation(String recommendationId) async {
    await _recommendationsRef.doc(recommendationId).update({'approved': true});
  }

  // Verify a recommendation (admin only)
  Future<void> verifyRecommendation(String recommendationId) async {
    await _recommendationsRef.doc(recommendationId).update({'verified': true});
  }

  // Delete a recommendation (admin only)
  Future<void> deleteRecommendation(String recommendationId) async {
    await _recommendationsRef.doc(recommendationId).delete();
  }

  // Get pending (not approved) recommendations (for admin)
  Future<List<Recommendation>> getPendingRecommendations() async {
    final snapshot =
        await _recommendationsRef
            .where('approved', isEqualTo: false)
            .orderBy('created_at', descending: true)
            .get();

    return snapshot.docs
        .map((doc) => RecommendationFirestore.fromDoc(doc))
        .toList();
  }
}

@Riverpod(keepAlive: true)
RecommendationsRepository recommendationsRepository(Ref ref) {
  return RecommendationsRepository();
}

@Riverpod(keepAlive: true)
Future<List<Recommendation>> getRecommendations(Ref ref) {
  final repository = ref.read(recommendationsRepositoryProvider);
  return repository.getRecommendations();
}

@riverpod
Future<List<Recommendation>> getPendingRecommendations(Ref ref) {
  final repository = ref.read(recommendationsRepositoryProvider);
  return repository.getPendingRecommendations();
}
