import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/styled_card.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/easyclubapp-780f8.firebasestorage.app/o/whatsapp.jpg?alt=media&token=4d25b3e4-fbd6-4e54-8f21-b08601b37f3b',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: context.colorScheme.onSurface.withValues(alpha: 0.1),
                      child: Icon(
                        Icons.image_not_supported,
                        color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                        size: 48,
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(24),
            Text('Project Title'),
            Gap(8),
            Text('Short description of the project goes here.', style: TextStyle(color: context.colorScheme.onSurface),),
            Gap(8),
            Expanded(child: Text('Technologies: Flutter, Dart', 
            style: TextStyle(color: context.colorScheme.onSurface), maxLines: 4, overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}
