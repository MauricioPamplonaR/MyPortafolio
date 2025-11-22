import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/projects/presentation/project_item.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/home_title_subtitle.dart';

class HomeProjectsList extends StatelessWidget {
  const HomeProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeTitleSubtitle(
          title: 'Projects',
          subtitle: 'A selection of my recent work'),
          Gap(32),
          context.isDesktop ?_HomeProjectsListDesktop() : const _HomeCourseListPhone(),
         ],);
  }
}

class _HomeProjectsListDesktop extends StatelessWidget {
  const _HomeProjectsListDesktop();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        children: [
          Expanded(child: ProjectItem()),
          const Gap(16),
          Expanded(child: ProjectItem()),
          const Gap(16),
          Expanded(child: ProjectItem()),
        ],
      ),
    );
  }
}

class _HomeCourseListPhone extends StatelessWidget {
  const _HomeCourseListPhone();

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
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: index < 4 ? 16 : 0),
              width: 240,
              child: ProjectItem(),
            );
          },
        ),
      ),
    );
  }
}
