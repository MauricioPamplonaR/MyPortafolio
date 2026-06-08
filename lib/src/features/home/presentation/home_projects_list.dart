import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/projects/data/remote_projects_repository.dart';
import 'package:portafolio_app_web/src/features/projects/presentation/project_item.dart';
import 'package:portafolio_app_web/src/widgets/app_loading_indicator.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/home_title_subtitle.dart';

class HomeProjectsList extends ConsumerWidget {
  const HomeProjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(getProjectsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.projectsTitle,
          subtitle: context.texts.projectsSubtitle,
        ),
        const Gap(32),
        projectsAsync.when(
          data: (projects) => context.isDesktop
              ? _HomeProjectsListDesktop(projects: projects)
              : _HomeCourseListPhone(projects: projects),
          loading: () => const AppLoadingIndicator(),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}

class _HomeProjectsListDesktop extends StatelessWidget {
  const _HomeProjectsListDesktop({required this.projects});
  final List projects;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: SizedBox(
        height: 450,
        child: Row(
          children: projects.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return Expanded(
              child: Row(
                children: [
                  Expanded(child: ProjectItem(project: project)),
                  if (index < projects.length - 1) const Gap(16),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _HomeCourseListPhone extends StatelessWidget {
  const _HomeCourseListPhone({required this.projects});
  final List projects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: index < projects.length - 1 ? 16 : 0),
              width: 240,
              child: ProjectItem(project: projects[index]),
            );
          },
        ),
      ),
    );
  }
}
