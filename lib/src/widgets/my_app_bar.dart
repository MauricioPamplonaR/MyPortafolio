import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_app_web/constans/app_menu_list.dart';
import 'package:portafolio_app_web/shared/app_theme_controller.dart';
import 'package:portafolio_app_web/src/features/auth/data/auth_repository.dart';
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
                  const SizedBox(width: 15),
                  ThemeToggle(),
                  const SizedBox(width: 8),
                  const UserAvatarButton(),
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
      context.texts.appTitle,
      style: context.textStyle.titleLgBold,
    );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children:
       AppMenuList.getItems(context)
       .map((AppMenu e) => LargeAppBarMenuItem(
       text: e.title,
       isSelected: GoRouterState.of(context).fullPath == e.path,
       onTap: () {
        context.go(e.path);
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
       text: e.title, 
       isSelected: GoRouterState.of(context).fullPath == e.path, 
       onTap: () {
        context.go(e.path);
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
        child: Text(
          text, style: SmallTextStyles().bodyLgMedium.copyWith(
            color: isSelected ? context.colorScheme.onSurface : context.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
          ),
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

class UserAvatarButton extends ConsumerWidget {
  const UserAvatarButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton<String>(
      offset: const Offset(0, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: user.photoURL != null
            ? NetworkImage(user.photoURL!)
            : null,
        child: user.photoURL == null
            ? Text(
                (user.displayName ?? user.email ?? 'U')[0].toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            : null,
      ),
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.displayName ?? 'Usuario',
                style: context.textStyle.bodyLgBold,
              ),
              Text(
                user.email ?? '',
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'signout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 20, color: context.colorScheme.error),
              const SizedBox(width: 8),
              Text(
                'Cerrar sesión',
                style: TextStyle(color: context.colorScheme.error),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) async {
        if (value == 'signout') {
          final authRepo = ref.read(authRepositoryProvider);
          await authRepo.signOut();
        }
      },
    );
  }
}

