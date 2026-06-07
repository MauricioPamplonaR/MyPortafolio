import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_app_web/constans/app_admin.dart';
import 'package:portafolio_app_web/constans/app_contact.dart';
import 'package:portafolio_app_web/constans/app_icon.dart';
import 'package:portafolio_app_web/routes/app_routes.dart';
import 'package:portafolio_app_web/src/features/auth/data/auth_repository.dart';
import 'package:portafolio_app_web/src/features/recommendations/data/recommendations_repository.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/my_app_bar.dart';
import 'package:portafolio_app_web/src/widgets/powered_by_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.insets.padding),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(context.insets.padding),
        child: Column(
          children: [
            context.isDesktop ? _DesktopFooter() : _PhoneFooter(),
            Divider(height: 24),
            PoweredByFlutter(),
            Text(context.texts.footerCopyright),
          ],
        ),
      ),
    );
  }
}

class _PhoneFooter extends StatelessWidget {
  const _PhoneFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLogo(),
        const SizedBox(height: 10),
        const SmallMenu(),
        const SizedBox(height: 10),
        _FooterLinks(),
      ],
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [AppLogo(), Flexible(child: LargeMenu()), _FooterLinks()],
    );
  }
}

class _FooterLinks extends ConsumerWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final isAdmin = AppAdmin.canAccess(user?.email);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(
          onPressed:
              () => launchUrl(
                Uri.parse(AppContact.youtubeUrl),
                mode: LaunchMode.externalApplication,
              ),
          icon: AppIcon.youtube,
        ),
        _FooterLinkItem(
          onPressed:
              () => launchUrl(
                Uri.parse(AppContact.instagramUrl),
                mode: LaunchMode.externalApplication,
              ),
          icon: AppIcon.instagram,
        ),
        _FooterLinkItem(
          onPressed:
              () => launchUrl(
                Uri.parse(AppContact.githubUrl),
                mode: LaunchMode.externalApplication,
              ),
          icon: AppIcon.github,
        ),
        _FooterLinkItem(
          onPressed:
              () => launchUrl(
                Uri.parse(AppContact.linkedinUrl),
                mode: LaunchMode.externalApplication,
              ),
          icon: AppIcon.linkedin,
        ),
        if (isAdmin) const _AdminFooterButton(),
      ],
    );
  }
}

class _AdminFooterButton extends ConsumerWidget {
  const _AdminFooterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingRecommendations = ref.watch(getPendingRecommendationsProvider);
    final pendingCount = pendingRecommendations.maybeWhen(
      data: (recommendations) => recommendations.length,
      orElse: () => 0,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          tooltip: 'Administrar recomendaciones',
          onPressed: () => context.go(Routes.admin),
          icon: Icon(
            Icons.admin_panel_settings,
            size: context.isDesktop ? 28 : 24,
            color: context.colorScheme.onSurface,
          ),
        ),
        if (pendingCount > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.error,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                pendingCount > 99 ? '99+' : '$pendingCount',
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onError,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        width: context.isDesktop ? 28 : 24,
        height: context.isDesktop ? 28 : 24,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
