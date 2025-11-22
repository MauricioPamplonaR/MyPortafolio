import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -(context.width / 2 / 2),
      left: -(context.width / 2 / 2),
      child: Container(
        width: context.width / 2,
        height: context.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 200.0,
              spreadRadius: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
