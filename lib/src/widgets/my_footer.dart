import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_app_web/constans/app_icon.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/my_app_bar.dart';
import 'package:portafolio_app_web/src/widgets/powered_by_flutter.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.insets.padding),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() :  _PhoneFooter(),
          Divider(height: 24),
          PoweredByFlutter(),
          Text(
            context.texts.footerCopyright,
          ),
        ]
          ),
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
        SmallMenu(),
        SizedBox(height: 10),
        _FooterLinks(),
      ],
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLogo(),
        Flexible(
          child: LargeMenu(),
        ),
        _FooterLinks(),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(
          onPressed: () {},
          icon: AppIcon.youtube,
        ),
        _FooterLinkItem(
          onPressed: () {},
          icon: AppIcon.instagram,
        ),
        _FooterLinkItem(
          onPressed: () {},
          icon: AppIcon.github,
        ),
        _FooterLinkItem(
          onPressed: () {},
          icon: AppIcon.linkedin,
        ),
       
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem( {
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        width: context.isDesktop ? 28 : 24,
        height: context.isDesktop ? 28 : 24,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onSurface,
          BlendMode.srcIn
        ),
      ),
    );
  }
}