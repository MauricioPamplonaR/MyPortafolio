import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.size = 40,
    this.strokeWidth = 4,
    this.value,
  });

  final double size;
  final double strokeWidth;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          value: value,
        ),
      ),
    );
  }
}

class AppSliverLoadingIndicator extends StatelessWidget {
  const AppSliverLoadingIndicator({
    super.key,
    this.padding = const EdgeInsets.all(32),
    this.size = 40,
  });

  final EdgeInsetsGeometry padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(padding: padding, child: AppLoadingIndicator(size: size)),
    );
  }
}
