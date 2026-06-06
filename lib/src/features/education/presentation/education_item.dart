import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/shared/app_locale_controller.dart';
import 'package:portafolio_app_web/src/features/education/domain/education.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';
import 'package:url_launcher/url_launcher.dart';

const eduWidth = 300.0;
const eduHeight = 370.0;

class EducationItem extends ConsumerWidget {
  const EducationItem({super.key, required this.education});
  final Education education;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider).value ?? 'en';

    return StyledCard(
      width: eduWidth,
      height: eduHeight,
      borderEffect: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo de la plataforma (circular)
          _PlatformLogo(imageUrl: education.imageUrl),
          const Gap(6),

          // Nombre de la plataforma (Udemy, Coursera, etc.)
          if ((education.name[locale] ?? '').isNotEmpty)
            Text(
              education.name[locale] ?? '',
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.primary.withValues(alpha: 1),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          const Gap(10),

          // Título del curso
          Text(
            education.title[locale] ?? '',
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const Gap(4),

          // Instructor
          Text(
            education.instructor[locale] ?? '',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.95),
            ),
          ),
          const Gap(12),

          // Skills como chips centrados
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children:
                education.skills
                    .take(3)
                    .map((skill) => _SkillChip(skill: skill))
                    .toList(),
          ),
          const Gap(10),

          // Duración
          if ((education.duration[locale] ?? '').isNotEmpty)
            Text(
              education.duration[locale] ?? '',
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.9),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

          const Spacer(),

          // Botón ver certificado
          if (education.link.isNotEmpty)
            _CertificateButton(link: education.link, locale: locale),
        ],
      ),
    );
  }
}

class _PlatformLogo extends StatelessWidget {
  const _PlatformLogo({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final logoUrl = imageUrl.validNetworkUrl;

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withValues(alpha: 0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colorScheme.surface,
        ),
        child: ClipOval(
          child:
              logoUrl != null
                  ? Image.network(
                    logoUrl,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const _PlaceholderIcon(),
                  )
                  : const _PlaceholderIcon(),
        ),
      ),
    );
  }
}

class _PlaceholderIcon extends StatelessWidget {
  const _PlaceholderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary.withValues(alpha: 0.1),
      child: Icon(
        Icons.school_outlined,
        color: context.colorScheme.primary,
        size: 28,
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.skill});
  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: context.colorScheme.onSurface,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CertificateButton extends StatelessWidget {
  const _CertificateButton({required this.link, required this.locale});
  final String link;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse(link);
          await launchUrl(uri, webOnlyWindowName: '_blank');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorScheme.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          locale == 'es' ? 'Ver Certificado' : 'View Certificate',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ),
    );
  }
}
