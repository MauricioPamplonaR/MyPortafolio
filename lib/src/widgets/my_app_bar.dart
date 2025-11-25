import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/constans/app_menu_list.dart';
import 'package:portafolio_app_web/shared/app_theme_controller.dart';
import 'package:portafolio_app_web/src/widgets/app_bar_drawer_icon.dart';
import 'package:portafolio_app_web/src/widgets/drawer_menu.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/language_swich.dart';
import 'package:portafolio_app_web/styles/app_size.dart';
import 'package:portafolio_app_web/styles/app_text_style.dart';


class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  // bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Container(
            alignment: Alignment.center,
            height: context.insets.appBarHeight,
            // color: Colors.amber,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: ConstrainedBox(
              constraints: BoxConstraints(
              maxWidth: Insets.maxWidth),
              child: Row(
                children:  [
                  AppLogo(),
                  Spacer(),
                   if (context.isDesktop) LargeMenu(),
                  Spacer(),
                  LanguageSwich(),
                  SizedBox(width: 15),
                  ThemeToggle(),
                  if (!context.isDesktop) AppBarDrawerIcon(),

                ],
              ),
            ),
          ),
        ),
        if (!context.isDesktop)
       const DrawerMenu(),
      ],
    );
  }
}
class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      'Portafolio',      
       style: context.textStyle.titleLgBold,   
      );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: 
       AppMenuList.getItems(context)
       .map((AppMenu e) => LargeAppBarMenuItem(
       text: e.title, isSelected: true, onTap: () {
        },)).toList()      
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
       AppMenuList.getItems(context)
       .map((AppMenu e) => LargeAppBarMenuItem(
       text: e.title, isSelected: true, onTap: () {
        },)).toList()      
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem
  ({
    super.key, 
    required this.text, 
    required this.isSelected, 
    required this.onTap
    });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.xs),
        child: Text(text, style: SmallTextStyles().bodyLgMedium,
        ),
        
       
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
   final state = ref.watch(appThemeControllerProvider);
    return Switch(  
      value: state.value == ThemeMode.dark,  
      activeTrackColor: Colors.grey,
      // activeThumbColor: Colors.black54,
      inactiveTrackColor: Colors.black,
      // inactiveThumbColor: Colors.white,
      onChanged: (value) {
        ref.read(appThemeControllerProvider.notifier).changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}

