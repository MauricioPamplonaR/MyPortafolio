import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/my_app_bar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() :  _PhoneFooter(),
          Divider(height: 24),
          Text(
          '© 2024 Mauricio Pamplona. All rights reserved.',
          ),
        ]
          ),
    );
  }
}
class _PhoneFooter extends StatelessWidget {
  const _PhoneFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppLogo(),
        SizedBox(height: 10),
        SmallMenu()
      ],
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AppLogo(),
        Spacer(),
        LargeMenu(),
        Spacer(),
      ],
    );
  }
}