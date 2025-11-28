import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portafolio_app_web/src/features/testimonio/presentation/testimony_item.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';

class TestimonioList extends StatelessWidget {
  const TestimonioList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? const _DesktopTestimony()
        : const _PhoneTestimony();
  }
}

class _DesktopTestimony extends StatelessWidget {
  const _DesktopTestimony();

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return TestimonyItem();
      }, childCount: 9),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
    );
  }
}

class _PhoneTestimony extends StatelessWidget {
  const _PhoneTestimony();

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return TestimonyItem();
      },
      separatorBuilder: (context, index) => Gap(16),
        
      
      itemCount: 9,
    );
  }
}


