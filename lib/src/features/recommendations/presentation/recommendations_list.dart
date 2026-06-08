import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/presentation/recommendation_item.dart';
import 'package:portafolio_app_web/src/widgets/app_loading_indicator.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class RecommendationsList extends ConsumerWidget {
  const RecommendationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationsAsync = ref.watch(getRecommendationsProvider);

    return recommendationsAsync.when(
      data: (recommendations) {
        if (recommendations.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  context.texts.noRecommendations,
                  style: context.textStyle.bodyLgMedium.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        return context.isDesktop
            ? _DesktopRecommendations(recommendations: recommendations)
            : _PhoneRecommendations(recommendations: recommendations);
      },
      loading: () => const AppSliverLoadingIndicator(),
      error: (error, stack) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'Error: $error',
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopRecommendations extends StatelessWidget {
  const _DesktopRecommendations({required this.recommendations});

  final List recommendations;

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return RecommendationItem(
            recommendation: recommendations[index],
          );
        },
        childCount: recommendations.length,
      ),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
    );
  }
}

class _PhoneRecommendations extends StatelessWidget {
  const _PhoneRecommendations({required this.recommendations});

  final List recommendations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final isLast = index == recommendations.length - 1;
          return Column(
            children: [
              RecommendationItem(
                recommendation: recommendations[index],
              ),
              if (!isLast)
                SizedBox(
                  height: 60,
                  child: DottedLine(
                    dashColor: context.colorScheme.onSurface,
                    direction: Axis.vertical,
                  ),
                ),
            ],
          );
        },
        childCount: recommendations.length,
      ),
    );
  }
}
