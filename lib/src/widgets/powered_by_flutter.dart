import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterLogo(size: 26),
          SizedBox(width: 10),
          Text(context.texts.poweredByFlutter),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}