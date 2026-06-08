import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/auth/data/auth_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation_comment.dart';
import 'package:portafolio_app_web/src/widgets/app_loading_indicator.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class CommentsDialog extends ConsumerStatefulWidget {
  const CommentsDialog({
    super.key,
    required this.recommendation,
    required this.onCommentAdded,
  });

  final Recommendation recommendation;
  final VoidCallback onCommentAdded;

  @override
  ConsumerState<CommentsDialog> createState() => _CommentsDialogState();
}

class _CommentsDialogState extends ConsumerState<CommentsDialog> {
  final _commentController = TextEditingController();
  List<RecommendationComment> _comments = [];
  bool _isLoading = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _loadComments() async {
    final repository = ref.read(recommendationsRepositoryProvider);
    final comments = await repository.getComments(widget.recommendation.id!);
    if (mounted) {
      setState(() {
        _comments = comments;
        _isLoading = false;
      });
    }
  }

  Future<void> _submitComment() async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      _showSignInDialog();
      return;
    }

    final content = _commentController.text.trim();
    if (content.isEmpty) return;

    setState(() => _isSubmitting = true);

    try {
      final repository = ref.read(recommendationsRepositoryProvider);
      final comment = RecommendationComment(
        authorName: user.displayName ?? 'Anonymous',
        authorEmail: user.email ?? '',
        authorPhotoUrl: user.photoURL,
        content: content,
        createdAt: DateTime.now(),
      );

      await repository.addComment(widget.recommendation.id!, comment);

      _commentController.clear();
      widget.onCommentAdded();
      await _loadComments();
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _showSignInDialog() {
    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: Text(context.texts.signInRequired),
            content: Text(context.texts.signInToInteract),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(context.texts.cancel),
              ),
              FilledButton(
                onPressed: () async {
                  Navigator.pop(dialogContext);
                  final authRepo = ref.read(authRepositoryProvider);
                  await authRepo.signInWithGoogle();
                },
                child: Text(context.texts.signInWithGoogle),
              ),
            ],
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
    final user = ref.watch(currentUserProvider);

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Text(
                    context.texts.comments,
                    style: context.textStyle.titleSmBold,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Gap(16),

              // Comments list
              Flexible(
                child:
                    _isLoading
                        ? const AppLoadingIndicator()
                        : _comments.isEmpty
                        ? Center(
                          child: Text(
                            context.texts.noComments,
                            style: context.textStyle.bodyMdMedium.copyWith(
                              color: context.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        )
                        : ListView.separated(
                          shrinkWrap: true,
                          itemCount: _comments.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final comment = _comments[index];
                            return _CommentItem(
                              comment: comment,
                              timeAgo: _getTimeAgo(comment.createdAt),
                            );
                          },
                        ),
              ),

              const Gap(16),
              const Divider(),
              const Gap(8),

              // Add comment section
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (user != null) ...[
                    CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          user.photoURL != null
                              ? NetworkImage(user.photoURL!)
                              : null,
                      child:
                          user.photoURL == null
                              ? Text(
                                user.displayName?.isNotEmpty == true
                                    ? user.displayName![0].toUpperCase()
                                    : '?',
                                style: context.textStyle.bodyLgBold,
                              )
                              : null,
                    ),
                    const Gap(12),
                  ],
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: context.texts.writeComment,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      maxLines: 2,
                      minLines: 1,
                      maxLength: 500,
                      onSubmitted: (_) => _submitComment(),
                    ),
                  ),
                  const Gap(8),
                  IconButton.filled(
                    onPressed: _isSubmitting ? null : _submitComment,
                    icon:
                        _isSubmitting
                            ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: AppLoadingIndicator(
                                size: 20,
                                strokeWidth: 2,
                              ),
                            )
                            : const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({required this.comment, required this.timeAgo});

  final RecommendationComment comment;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage:
                comment.authorPhotoUrl != null
                    ? NetworkImage(comment.authorPhotoUrl!)
                    : null,
            child:
                comment.authorPhotoUrl == null
                    ? Text(
                      comment.authorName.isNotEmpty
                          ? comment.authorName[0].toUpperCase()
                          : '?',
                      style: context.textStyle.bodyMdMedium,
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
                    Text(
                      comment.authorName,
                      style: context.textStyle.bodyLgBold,
                    ),
                    const Gap(8),
                    Text(
                      timeAgo,
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(4),
                Text(comment.content, style: context.textStyle.bodyMdMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
