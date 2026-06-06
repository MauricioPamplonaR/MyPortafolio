import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/auth/data/auth_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation.dart';
import 'package:portafolio_app_web/src/features/recommendations/presentation/comments_dialog.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';

class RecommendationItem extends ConsumerStatefulWidget {
  const RecommendationItem({super.key, required this.recommendation});

  final Recommendation recommendation;

  @override
  ConsumerState<RecommendationItem> createState() => _RecommendationItemState();
}

class _RecommendationItemState extends ConsumerState<RecommendationItem> {
  bool _hasLiked = false;
  bool _isLiking = false;
  late int _likesCount;
  late int _commentsCount;

  @override
  void initState() {
    super.initState();
    _likesCount = widget.recommendation.likesCount;
    _commentsCount = widget.recommendation.commentsCount;
    _loadInteractionState();
  }

  Future<void> _loadInteractionState() async {
    final recommendationId = widget.recommendation.id;
    if (recommendationId == null) return;
    final repository = ref.read(recommendationsRepositoryProvider);
    final user = ref.read(currentUserProvider);

    final likesCount = await repository.getLikesCount(recommendationId);
    final commentsCount = await repository.getCommentsCount(recommendationId);
    final hasLiked =
        user == null
            ? false
            : await repository.hasUserLiked(recommendationId, user.uid);

    if (mounted) {
      setState(() {
        _hasLiked = hasLiked;
        _likesCount = likesCount;
        _commentsCount = commentsCount;
      });
    }
  }

  Future<void> _toggleLike() async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      _showSignInDialog();
      return;
    }

    if (_isLiking) return;

    setState(() => _isLiking = true);

    try {
      final recommendationId = widget.recommendation.id;
      if (recommendationId == null) return;

      final repository = ref.read(recommendationsRepositoryProvider);
      await repository.toggleLike(recommendationId, user.uid);
      final likesCount = await repository.getLikesCount(recommendationId);
      final hasLiked = await repository.hasUserLiked(
        recommendationId,
        user.uid,
      );

      if (mounted) {
        setState(() {
          _hasLiked = hasLiked;
          _likesCount = likesCount;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLiking = false);
      }
    }
  }

  void _showSignInDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.texts.signInRequired),
            content: Text(context.texts.signInToInteract),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.texts.cancel),
              ),
              FilledButton(
                onPressed: () async {
                  Navigator.pop(context);
                  final authRepo = ref.read(authRepositoryProvider);
                  await authRepo.signInWithGoogle();
                },
                child: Text(context.texts.signInWithGoogle),
              ),
            ],
          ),
    );
  }

  void _showCommentsDialog() {
    if (widget.recommendation.id == null) return;

    showDialog(
      context: context,
      builder:
          (context) => CommentsDialog(
            recommendation: widget.recommendation,
            onCommentAdded: () {
              setState(() => _commentsCount++);
            },
          ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else if (difference.inDays > 7) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else if (difference.inDays > 0) {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final recommendation = widget.recommendation;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Photo, Name, Relationship, Verified badge
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage:
                    recommendation.authorPhotoUrl != null
                        ? NetworkImage(recommendation.authorPhotoUrl!)
                        : null,
                child:
                    recommendation.authorPhotoUrl == null
                        ? Text(
                          recommendation.authorName.isNotEmpty
                              ? recommendation.authorName[0].toUpperCase()
                              : '?',
                          style: context.textStyle.bodyLgBold,
                        )
                        : null,
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            recommendation.authorName,
                            style: context.textStyle.bodyLgBold.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (recommendation.verified) ...[
                          const Gap(6),
                          Icon(
                            Icons.verified,
                            size: 18,
                            color: context.colorScheme.primary,
                          ),
                        ],
                      ],
                    ),
                    Text(
                      recommendation.relationship,
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(16),

          // Content
          Text(
            recommendation.content,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),

          const Gap(16),

          // Footer: Likes, Comments, Time
          Row(
            children: [
              // Like button
              InkWell(
                onTap: _toggleLike,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _hasLiked ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color:
                            _hasLiked
                                ? Colors.red
                                : context.colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                      ),
                      const Gap(4),
                      Text(
                        '$_likesCount',
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(16),

              // Comments button
              InkWell(
                onTap: _showCommentsDialog,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 20,
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        '$_commentsCount',
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Time ago
              Text(
                _getTimeAgo(recommendation.createdAt),
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
