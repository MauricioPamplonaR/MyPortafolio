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
            borderRadius: widget.borderRadius ??
             BorderRadius.circular(24),

          ),
          child: widget.child,
        ),
        if (widget.borderEffect) ...[
          CustomPaint(
            size: Size(widget.width ?? 0, widget.height ?? 0),
            painter: CurvedLinePainter(
              color: context.colorScheme.primary,
              isDark: context.theme.brightness == Brightness.dark,
            ),
          ),
        ]
      ],
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;
  final bool isDark;

  CurvedLinePainter({super.repaint, required this.color, this.isDark = true});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final alpha = isDark ? 0.6 : 0.3;
    final strokeWidth = isDark ? 4.0 : 2.0;

    final topLeftpaint = Paint()
     ..shader = LinearGradient(
        colors: [color.withValues(alpha: alpha), color.withValues(alpha: 0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
       const Rect.fromLTWH(0, 0, lineSize, lineSize),
       )
       ..style = PaintingStyle.stroke
       ..strokeWidth = strokeWidth
       ..strokeCap = StrokeCap.round;

    final bottomRightpaint = Paint()
     ..shader = LinearGradient(
        colors: [color.withValues(alpha: alpha), color.withValues(alpha: 0)],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(
        Rect.fromLTWH(
          size.width - lineSize, size.height - lineSize, lineSize, lineSize),
          )
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);
    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(size.width, size.height, size.width, size.height, size.width,
       size.height - lineSize);

    canvas.drawPath(path, topLeftpaint);
    canvas.drawPath(path2, bottomRightpaint);

  }

  @override
  bool shouldRepaint(covariant CurvedLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics( CurvedLinePainter oldDelegate) => true;

  
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
            color: context.colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
