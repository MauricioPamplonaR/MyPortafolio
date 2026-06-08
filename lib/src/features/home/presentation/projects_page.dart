import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/src/features/projects/data/remote_projects_repository.dart';
import 'package:portafolio_app_web/src/features/projects/presentation/project_item.dart';
import 'package:portafolio_app_web/src/widgets/app_loading_indicator.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final projectsAsync = ref.watch(getProjectsProvider);
    return AppScaffold(
      slivers: [
        projectsAsync.when(
          data: (projects) {
            final widthBasedCount = context.mq.size.width ~/ 300;
            final crossAxisCount =
                widthBasedCount < 1
                    ? 1
                    : widthBasedCount > 3
                    ? 3
                    : widthBasedCount;

            return SliverPadding(
              padding: EdgeInsets.all(context.insets.padding),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProjectItem(project: projects[index]);
                },
                itemCount: projects.length,
              ),
            );
          },
          loading: () => const AppSliverLoadingIndicator(),
          error:
              (error, stack) => SliverToBoxAdapter(
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
        ),
      ],
    );
  }
}
