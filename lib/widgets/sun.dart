import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Sun extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(50, 50)
      ..relativeQuadraticBezierTo(50, 50, 100, 0)
      ..relativeQuadraticBezierTo(100, 0, 100, 20)
      ..relativeQuadraticBezierTo(10, 20, 100, 20)
      ..relativeQuadraticBezierTo(10, 20, 100, 20)
      ..close();

    canvas.drawPath(path1, paint);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      // Annotate a rectangle containing the picture of the sun
      // with the label "Sun". When text to speech feature is enabled on the
      // device, a user will be able to locate the sun on this picture by
      // touch.
      Rect rect = Offset.zero & size;
      final double width = size.shortestSide * 0.4;
      rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
      return <CustomPainterSemantics>[
        CustomPainterSemantics(
          rect: rect,
          properties: const SemanticsProperties(
            label: 'Sun',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  @override
  bool shouldRepaint(Sun oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sun oldDelegate) => false;
}
