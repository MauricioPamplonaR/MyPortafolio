import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/domain/recommendation.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';

const String adminEmail = 'mauropam77@gmail.com';

bool isAdmin() {
  final user = FirebaseAuth.instance.currentUser;
  return user?.email == adminEmail;
}

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isAdmin()) {
      return AppScaffold(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Acceso denegado',
                style: context.textStyle.titleLgBold,
              ),
            ),
          ),
        ],
      );
    }

    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(context.insets.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panel de Administración',
                  style: context.textStyle.titleLgBold,
                ),
                const Gap(8),
                Text(
                  'Recomendaciones pendientes de aprobación',
                  style: context.textStyle.bodyLgMedium.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverGap(16),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          sliver: const _PendingRecommendationsList(),
        ),
        const SliverGap(32),
      ],
    );
  }
}

class _PendingRecommendationsList extends ConsumerWidget {
  const _PendingRecommendationsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingAsync = ref.watch(getPendingRecommendationsProvider);

    return pendingAsync.when(
      data: (recommendations) {
        if (recommendations.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: Colors.green,
                    ),
                    const Gap(16),
                    Text(
                      'No hay recomendaciones pendientes',
                      style: context.textStyle.bodyLgMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverList.separated(
          itemBuilder: (context, index) {
            return _PendingRecommendationItem(
              recommendation: recommendations[index],
            );
          },
          separatorBuilder: (context, index) => const Gap(16),
          itemCount: recommendations.length,
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}

class _PendingRecommendationItem extends ConsumerWidget {
  const _PendingRecommendationItem({required this.recommendation});

  final Recommendation recommendation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: recommendation.authorPhotoUrl != null
                    ? NetworkImage(recommendation.authorPhotoUrl!)
                    : null,
                child: recommendation.authorPhotoUrl == null
                    ? Text(recommendation.authorName[0].toUpperCase())
                    : null,
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation.authorName,
                      style: context.textStyle.bodyLgBold,
                    ),
                    Text(
                      recommendation.authorEmail,
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    Text(
                      recommendation.relationship,
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(16),

          // Content
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              recommendation.content,
              style: context.textStyle.bodyMdMedium,
            ),
          ),

          const Gap(16),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton.icon(
                onPressed: () => _deleteRecommendation(context, ref),
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                label: const Text('Eliminar', style: TextStyle(color: Colors.red)),
              ),
              const Gap(12),
              FilledButton.icon(
                onPressed: () => _approveRecommendation(context, ref),
                icon: const Icon(Icons.check),
                label: const Text('Aprobar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _approveRecommendation(BuildContext context, WidgetRef ref) async {
    try {
      final repository = ref.read(recommendationsRepositoryProvider);
      await repository.approveRecommendation(recommendation.id!);

      ref.invalidate(getPendingRecommendationsProvider);
      ref.invalidate(getRecommendationsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Recomendación aprobada'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteRecommendation(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar recomendación'),
        content: const Text('¿Estás seguro de que quieres eliminar esta recomendación?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final repository = ref.read(recommendationsRepositoryProvider);
      await repository.deleteRecommendation(recommendation.id!);

      ref.invalidate(getPendingRecommendationsProvider);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Recomendación eliminada'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
