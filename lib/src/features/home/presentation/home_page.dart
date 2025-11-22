import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/home/presentation/experiences_body.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_widget.dart';
import 'package:portafolio_app_web/src/features/home/presentation/home_projects_list.dart';
import 'package:portafolio_app_web/src/features/home/presentation/testimonio_list.dart';
import 'package:portafolio_app_web/src/widgets/background_blur.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/my_app_bar.dart';
import 'package:portafolio_app_web/src/widgets/my_footer.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxWidth),
              child: CustomScrollView(
                slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 60)),
                    SliverToBoxAdapter(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.insets.padding  ),
                      child: HeroWidget(),
                    )),
                    SliverGap(context.insets.gap),
                    SliverToBoxAdapter(child: SizedBox(height: 80)),
                    SliverToBoxAdapter(child: HomeProjectsList()),
                    SliverToBoxAdapter(child: SizedBox(height: 80)),
                    SliverToBoxAdapter(child: ExperiencesBody()),
                    TestimonioList(),
                    SliverToBoxAdapter(
                      child: MyFooter(),
                    )
                ]
              ),
            ),
          ),
          const MyAppBar(),
        ],
      ),
    );
  }
}