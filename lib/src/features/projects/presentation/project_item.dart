import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/shared/app_locale_controller.dart';
import 'package:portafolio_app_web/src/features/projects/domain/projects.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';
import 'package:url_launcher/url_launcher.dart';

void _showDescriptionDialog(
  BuildContext context,
  Projects project,
  String locale,
) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(project.name[locale] ?? ''),
          content: SingleChildScrollView(
            child: Text(
              project.description[locale] ?? '',
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(locale == 'es' ? 'Cerrar' : 'Close'),
            ),
          ],
        ),
  );
}

class ProjectItem extends ConsumerWidget {
  const ProjectItem({super.key, required this.project});
  final Projects project;

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider).value ?? 'en';
    final imageUrl = project.imageUrl.validNetworkUrl;
    final apkUrl = project.apkUrl.validNetworkUrl;

    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child:
                  imageUrl == null
                      ? const _ProjectImagePlaceholder()
                      : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value:
                                  loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const _ProjectImagePlaceholder();
                        },
                      ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name[locale] ?? '',
                    style: context.textStyle.bodyLgBold.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      project.description[locale] ?? '',
                      style: TextStyle(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                        fontSize: 13,
                      ),
                      maxLines: apkUrl == null ? 8 : 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 32),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed:
                          () =>
                              _showDescriptionDialog(context, project, locale),
                      child: Text(
                        context.texts.readMore,
                        style: TextStyle(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.8,
                          ),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (apkUrl != null) ...[
                    const Gap(8),
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(apkUrl),
                            webOnlyWindowName: '_blank',
                          );
                        },
                        icon: const Icon(Icons.android, size: 18),
                        label: Text(
                          context.texts.downloadApk,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectImagePlaceholder extends StatelessWidget {
  const _ProjectImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onSurface.withValues(alpha: 0.1),
      child: Icon(
        Icons.image_not_supported,
        color: context.colorScheme.onSurface.withValues(alpha: 0.5),
        size: 48,
      ),
    );
  }
}
