import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/background_blur.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';
import 'package:portafolio_app_web/src/widgets/my_app_bar.dart';
import 'package:portafolio_app_web/src/widgets/my_footer.dart';
import 'package:portafolio_app_web/styles/app_size.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, this.slivers = const []});
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxWidth),
              padding: EdgeInsets.only(top: context.insets.appBarHeight),
              child: CustomScrollView(
                slivers: [
                  ...slivers,
                  SliverToBoxAdapter(
                    child: MyFooter(),
                  ),
                ]
              ),
            ),
          ),
          const MyAppBar(),
        ],
      ),
    );
  }
}