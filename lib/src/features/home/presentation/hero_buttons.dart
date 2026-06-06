import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_app_web/routes/app_routes.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_button.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          title: context.texts.projects,
          onTap: () => context.go(Routes.projects),
        ),
        Gap(Insets.lg),
        OutlineButton(
          title: context.texts.contact,
          onTap: () => context.go(Routes.contact),
        ),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: context.texts.projects,
            onTap: () => context.go(Routes.projects),
          ),
        ),
        Gap(Insets.lg),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(
            title: context.texts.contact,
            onTap: () => context.go(Routes.contact),
          ),
        ),
      ],
    );
  }
}
