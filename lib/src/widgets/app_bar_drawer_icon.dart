import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_app_web/src/widgets/drawer_menu.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon> 
  with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  late final Animation<double> animation;

  bool isOpen = false;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isOpen) {
          controller.forward();
          ref.read(drawerMenuControllerProvider.notifier).open();
        } else {
          controller.reverse();
          ref.read(drawerMenuControllerProvider.notifier).close();
        }
        isOpen = !isOpen;
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close, 
        progress: animation
        ),
    );
  }
 }
 


