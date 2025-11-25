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
    this.borderEffect = false,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          _BorderShadow(),
          Positioned(right: 0, bottom: 0, child: _BorderShadow()),
        ],

        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
          decoration: BoxDecoration(
             border: Border.all(
              color: context.colorScheme.outline,
            ),
            color: context.colorScheme.surface.withValues(alpha: 0.9),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(24),

          ),
          child: widget.child,
        ),
      ],
    );
  }
}

class _BorderShadow extends StatelessWidget {
  const _BorderShadow(
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
