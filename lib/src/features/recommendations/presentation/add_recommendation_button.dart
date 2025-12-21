import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/auth/data/auth_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class AddRecommendationButton extends ConsumerWidget {
  const AddRecommendationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => _showAddRecommendationDialog(context, ref),
      icon: const Icon(Icons.add),
      label: Text(context.texts.leaveRecommendation),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showAddRecommendationDialog(BuildContext context, WidgetRef ref) {
    // Usar FirebaseAuth directamente en lugar del provider
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showSignInDialog(context, ref);
      return;
    }

    showDialog(
      context: context,
      builder: (dialogContext) => _AddRecommendationDialog(user: user),
    );
  }

  void _showSignInDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
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
              try {
                final authRepo = ref.read(authRepositoryProvider);
                final user = await authRepo.signInWithGoogle();

                // Si el inicio de sesión fue exitoso, mostrar el diálogo de recomendación
                if (user != null && context.mounted) {
                  showDialog(
                    context: context,
                    builder: (ctx) => _AddRecommendationDialog(user: user),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error al iniciar sesión: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(context.texts.signInWithGoogle),
          ),
        ],
      ),
    );
  }
}

class _AddRecommendationDialog extends ConsumerStatefulWidget {
  const _AddRecommendationDialog({required this.user});

  final User user;

  @override
  ConsumerState<_AddRecommendationDialog> createState() =>
      _AddRecommendationDialogState();
}

class _AddRecommendationDialogState
    extends ConsumerState<_AddRecommendationDialog> {
  final _contentController = TextEditingController();
  String _selectedRelationship = 'colleague';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  String _getRelationshipLabel(BuildContext context, String key) {
    switch (key) {
      case 'colleague':
        return context.texts.colleague;
      case 'client':
        return context.texts.client;
      case 'mentor':
        return context.texts.mentor;
      case 'student':
        return context.texts.student;
      case 'friend':
        return context.texts.friend;
      case 'other':
        return context.texts.other;
      default:
        return key;
    }
  }

  Future<void> _submit() async {
    if (_contentController.text.trim().isEmpty) return;

    setState(() => _isSubmitting = true);

    try {
      final repository = ref.read(recommendationsRepositoryProvider);
      final user = widget.user;

      final recommendation = Recommendation(
        authorName: user.displayName ?? 'Anonymous',
        authorEmail: user.email ?? '',
        authorPhotoUrl: user.photoURL,
        content: _contentController.text.trim(),
        relationship: _getRelationshipLabel(context, _selectedRelationship),
        createdAt: DateTime.now(),
        approved: false,
        verified: false,
      );

      await repository.addRecommendation(recommendation);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.texts.recommendationSent),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final relationships = ['colleague', 'client', 'mentor', 'student', 'friend', 'other'];

    return AlertDialog(
      title: Text(context.texts.leaveRecommendation),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: widget.user.photoURL != null
                      ? NetworkImage(widget.user.photoURL!)
                      : null,
                  child: widget.user.photoURL == null
                      ? Text(
                          (widget.user.displayName ?? 'A')[0].toUpperCase(),
                          style: context.textStyle.bodyLgBold,
                        )
                      : null,
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.displayName ?? 'Anonymous',
                        style: context.textStyle.bodyLgBold,
                      ),
                      Text(
                        widget.user.email ?? '',
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Gap(24),

            // Relationship dropdown
            Text(
              context.texts.yourRelationship,
              style: context.textStyle.bodyMdMedium,
            ),
            const Gap(8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: _selectedRelationship,
                isExpanded: true,
                underline: const SizedBox(),
                items: relationships.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(_getRelationshipLabel(context, r)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedRelationship = value);
                  }
                },
              ),
            ),

            const Gap(16),

            // Content text field
            TextField(
              controller: _contentController,
              maxLines: 5,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: context.texts.writeRecommendation,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.pop(context),
          child: Text(context.texts.cancel),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(context.texts.submit),
        ),
      ],
    );
  }
}
