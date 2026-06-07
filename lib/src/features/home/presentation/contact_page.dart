import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/constans/app_contact.dart';
import 'package:portafolio_app_web/constans/app_icon.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchContactUri(Uri uri) async {
  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(context.insets.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(context.insets.gap / 2),
                Text(
                  context.texts.contactTitle,
                  style: context.textStyle.titleLgBold.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const Gap(12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Text(
                    context.texts.contactSubtitle,
                    style: context.textStyle.bodyLgMedium.copyWith(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.75,
                      ),
                      height: 1.5,
                    ),
                  ),
                ),
                const Gap(32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cardWidth =
                        constraints.maxWidth >= 760
                            ? (constraints.maxWidth - 18) / 2
                            : constraints.maxWidth;

                    return Wrap(
                      spacing: 18,
                      runSpacing: 18,
                      children: [
                        _ContactAction(
                          width: cardWidth,
                          icon: _ContactIcon(
                            asset: AppIcon.whatsapp,
                            color: Color(0xFF25D366),
                            preserveAssetColor: true,
                          ),
                          title: context.texts.contactWhatsApp,
                          description: context.texts.contactWhatsAppDescription,
                          value: '+57 301 483 6962',
                          uri: AppContact.whatsappUri,
                        ),
                        _ContactAction(
                          width: cardWidth,
                          icon: const _ContactIcon(
                            label: '@',
                            color: Color(0xFF2563EB),
                          ),
                          title: context.texts.contactEmail,
                          description: context.texts.contactEmailDescription,
                          value: AppContact.email,
                          uri: AppContact.emailComposeUri,
                        ),
                        _ContactAction(
                          width: cardWidth,
                          icon: _ContactIcon(
                            asset: AppIcon.linkedin,
                            color: const Color(0xFF0A66C2),
                          ),
                          title: 'LinkedIn',
                          description: context.texts.contactLinkedInDescription,
                          value: 'mauricio-pamplona',
                          uri: Uri.parse(AppContact.linkedinUrl),
                        ),
                        _ContactAction(
                          width: cardWidth,
                          icon: _ContactIcon(
                            asset: AppIcon.github,
                            color: const Color(0xFF24292F),
                          ),
                          title: 'GitHub',
                          description: context.texts.contactGitHubDescription,
                          value: 'MauricioPamplonaR',
                          uri: Uri.parse(AppContact.githubUrl),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactAction extends StatefulWidget {
  const _ContactAction({
    required this.width,
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    required this.uri,
  });

  final double width;
  final Widget icon;
  final String title;
  final String description;
  final String value;
  final Uri uri;

  @override
  State<_ContactAction> createState() => _ContactActionState();
}

class _ContactActionState extends State<_ContactAction> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;
    final surfaceColor = context.colorScheme.surface.withValues(
      alpha: isDark ? 0.48 : 0.82,
    );
    final borderColor =
        _isHovered
            ? context.colorScheme.primary.withValues(alpha: 0.65)
            : context.colorScheme.outline.withValues(alpha: isDark ? 0.9 : 0.7);

    return Semantics(
      button: true,
      label: widget.title,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => _launchContactUri(widget.uri),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            width: widget.width,
            constraints: const BoxConstraints(minHeight: 148),
            transform: Matrix4.translationValues(
              0.0,
              _isHovered ? -2.0 : 0.0,
              0.0,
            ),
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: surfaceColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.icon,
                const Gap(18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: context.textStyle.bodyLgBold.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        widget.description,
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.68,
                          ),
                          height: 1.35,
                        ),
                      ),
                      const Gap(12),
                      Text(
                        widget.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactIcon extends StatelessWidget {
  const _ContactIcon({
    required this.color,
    this.asset,
    this.label,
    this.preserveAssetColor = false,
  }) : assert(asset != null || label != null);

  final String? asset;
  final String? label;
  final Color color;
  final bool preserveAssetColor;

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;
    final foreground =
        isDark && color.computeLuminance() < 0.25 ? Colors.white : color;

    return Container(
      width: 58,
      height: 58,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.18 : 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.16)),
      ),
      child:
          asset == null
              ? Text(
                label!,
                style: context.textStyle.bodyLgBold.copyWith(
                  color: foreground,
                  letterSpacing: 0,
                ),
              )
              : SvgPicture.asset(
                asset!,
                width: 25,
                height: 25,
                colorFilter:
                    preserveAssetColor
                        ? null
                        : ColorFilter.mode(foreground, BlendMode.srcIn),
              ),
    );
  }
}
