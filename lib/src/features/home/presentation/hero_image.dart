import 'package:flutter/material.dart';

class HeroImages extends StatelessWidget {
  const HeroImages({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AspectRatio(
      aspectRatio: 0.65,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(220)),
        child: Image.asset(
          isDark ? 'assets/img/mauriciop.jpg' : 'assets/img/mauro_light.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}