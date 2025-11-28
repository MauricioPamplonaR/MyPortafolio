import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.asset('assets/img/mauricio_pamplona.jpg').image, // Replace with your image asset
                ),
                Gap(16),
                Text(
                  context.texts.aboutMeTitle,
                  style: context.textStyle.titleLgBold,
                ),
                Gap(8),
                Text(
                  context.texts.aboutMeDescription,
                  style: context.textStyle.bodyMdMedium,
                ),

              ],
            ),
          ),
        ),
      ],
    );
  } 
}