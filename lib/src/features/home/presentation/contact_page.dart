import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/constans/app_contact.dart';
import 'package:portafolio_app_web/src/widgets/app_scaffold.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';
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
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _ContactAction(
                      icon: Icons.chat_outlined,
                      title: context.texts.contactWhatsApp,
                      description: context.texts.contactWhatsAppDescription,
                      uri: AppContact.whatsappUri,
                    ),
                    _ContactAction(
                      icon: Icons.mail_outline,
                      title: context.texts.contactEmail,
                      description: context.texts.contactEmailDescription,
                      uri: AppContact.emailUri,
                    ),
                    _ContactAction(
                      icon: Icons.work_outline,
                      title: 'LinkedIn',
                      description: context.texts.contactLinkedInDescription,
                      uri: Uri.parse(AppContact.linkedinUrl),
                    ),
                    _ContactAction(
                      icon: Icons.code,
                      title: 'GitHub',
                      description: context.texts.contactGitHubDescription,
                      uri: Uri.parse(AppContact.githubUrl),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactAction extends StatelessWidget {
  const _ContactAction({
    required this.icon,
    required this.title,
    required this.description,
    required this.uri,
  });

  final IconData icon;
  final String title;
  final String description;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    final width = context.isDesktop ? 360.0 : double.infinity;

    return SizedBox(
      width: width,
      child: StyledCard(
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _launchContactUri(uri),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: context.colorScheme.primary),
                ),
                const Gap(14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textStyle.bodyLgBold.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        description,
                        style: context.textStyle.bodyMdMedium.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.68,
                          ),
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Icon(
                  Icons.open_in_new,
                  size: 18,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.55),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
