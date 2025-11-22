import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_buttons.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_image.dart';
import 'package:portafolio_app_web/src/features/home/presentation/hero_texts.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/powered_by_flutter.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoweredByFlutter(),
        context.isDesktop || context.isTablet? const _LargeHero() : const _SmallHero(),
        
         
      ],
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(constraints: const BoxConstraints(
          maxWidth: 140,
        ),
          child: HeroImages(),
        ),
        Gap(Insets.xl),
        HeroTexts(),
        Gap(Insets.xxl),
        SmallHeroButtons(),
      ],
    );
  } 
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HeroImages()),
          Gap(Insets.xxxl),
        
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroTexts(),
              Gap(Insets.xxl),
              LargeHeroButtons(),
            ],
          ),
        ),
        SizedBox(width: Insets.xxxl),
        // LargeHeroButtons(),
      ],
    );
  }
}