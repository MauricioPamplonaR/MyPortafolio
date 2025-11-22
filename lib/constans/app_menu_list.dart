import 'package:flutter/material.dart';
import 'package:portafolio_app_web/routes/app_routes.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.texts.home, path: Routes.home),
      AppMenu(title: context.texts.aboutMe, path: Routes.aboutMe),
      AppMenu(title: context.texts.projects, path: Routes.projects),
      AppMenu(title: context.texts.contact, path: Routes.contact),

    ];

  }
}

class AppMenu {

  final String title;
  
  final String path;

  AppMenu({required this.title, required this.path});
}