import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyle.titleLgBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
            
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: context.textStyle.titleSmBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
     ),
    );
  }
}