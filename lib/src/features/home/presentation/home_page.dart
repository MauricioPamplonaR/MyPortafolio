import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/education/presentation/education_body.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_widget.dart';
import 'package:portafolio_app_web/src/features/home/presentation/home_projects_list.dart';
import 'package:portafolio_app_web/src/features/recommendations/presentation/add_recommendation_button.dart';
import 'package:portafolio_app_web/src/features/recommendations/presentation/recommendations_list.dart';
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
        SliverToBoxAdapter(child: EducationBody()),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitleSubtitle(
                title: context.texts.recommendationsTitle,
                subtitle: context.texts.recommendationsSubtitle,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
                child: const AddRecommendationButton(),
              ),
            ],
          ),
        ),
        SliverGap(context.insets.gap),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          sliver: const RecommendationsList(),
        ),
        SliverGap(context.insets.gap),
      ],
    );
  }
}
