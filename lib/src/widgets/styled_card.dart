import 'package:flutter/material.dart';
import 'package:portafolio_app_web/src/widgets/extensions.dart';


class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    required this.child,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withValues(alpha: 0.25),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.onSurface.withValues(alpha: 0.4)),
      ),
      child: widget.child,
    );
  }
}
