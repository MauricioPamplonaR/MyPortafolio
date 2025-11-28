import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/home/presentation/experiences_body.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_widget.dart';
import 'package:portafolio_app_web/src/features/home/presentation/home_projects_list.dart';
import 'package:portafolio_app_web/src/features/home/presentation/testimonio_list.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/home_title_subtitle.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: context.insets.padding,
              right: context.insets.padding,
              left: context.insets.padding,
            ),
            child: HeroWidget(),
          ),
        ),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(child: HomeProjectsList()),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(child: ExperiencesBody()),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: HomeTitleSubtitle(
              title: context.texts.testimonialsTitle,
              subtitle: context.texts.testimonialsSubtitle,
            ),
          ),
        ),
        SliverGap(context.insets.gap),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          sliver: TestimonioList(),
        ),
        SliverGap(context.insets.gap),
      ],
    );
  }
}
