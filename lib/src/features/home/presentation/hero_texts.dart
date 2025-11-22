import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/seo_text.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SEOText(
          'Mauricio Pamplona',
          // context.mauriciopamplona,
          textAlign: context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
              style: context.textStyle.titleLgBold.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.80),
              ),
          ),
          Gap((Insets.sm)),
          SEOText(
            'mobileAppDeveloper',
            // context.texts.mobileAppDeveloper,
            textAlign: context.isDesktopOrTablet
                ? TextAlign.left
                : TextAlign.center,
                style: context.textStyle.titleMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.80),
                ),
          ),
           Gap((Insets.lg)),
          SEOText(
            'mobileAppDeveloperDesc',
            // context.texts.mobileAppDeveloperDesc,
            textAlign: context.isDesktopOrTablet
                ? TextAlign.left
                : TextAlign.center,
                style: context.textStyle.titleMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.80),
                ),
          ),
      ],
    );
  }
}