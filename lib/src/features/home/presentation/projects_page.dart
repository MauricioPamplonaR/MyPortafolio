import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/src/features/projects/data/remote_projects_repository.dart';
import 'package:portafolio_app_web/src/features/projects/presentation/project_item.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final projects = ref.watch(getProjectsProvider);
    return AppScaffold(
      slivers: [
      if(projects.isLoading)
      const SliverToBoxAdapter(child: CircularProgressIndicator()),


        SliverPadding(padding:  EdgeInsets.all(context.insets.padding),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.mq.size.width ~/ 300 >= 3
              ? 3
              : context.mq.size.width ~/ 300,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
              ),
            itemBuilder: (context, index) {
              return ProjectItem(project: projects.value![index],);
            },
            itemCount: projects.value?.length ?? 0,
          ),
        ),
      ],
    );
  }
}