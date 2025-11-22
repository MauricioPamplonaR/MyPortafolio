import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/shared/app_locale_controller.dart';
import 'package:portafolio_app_web/constans/app_icon.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/seo_text.dart';

class LanguageSwich extends ConsumerWidget {
  const LanguageSwich({
    super.key, 
    this.language, 
    this.icon});

  final String? language;

  final String? icon;

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopupLanguageSwichItem(
              language: 'English', icon: AppIcon.us,
              )),
          PopupMenuItem(
            value: 1,
            child: PopupLanguageSwichItem(
              language: 'Español', icon: AppIcon.es,
              )),
        ];
      },
      initialValue: locale.value == 'en' ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('en');
        } else {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('es');
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: context.colorScheme.onSurface
          ),
          const Gap(4),
          SEOText(Localizations.localeOf(context).languageCode == 'en' ? 'English' : 'Español', style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      )
    );
  }
}

class PopupLanguageSwichItem extends StatelessWidget {
  const PopupLanguageSwichItem({
    super.key, 
    required this.language, 
    required this.icon,
    });

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const Gap(8),
        SEOText(language, style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(width: 10),
      ],
    );
  }
}
