import 'package:flutter/material.dart';

class WeatherIndicator extends CustomPainter {
  late final double wether;

  WeatherIndicator(this.wether) : super();
  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 10 / 3 * value - 7 / 3;
  }

  double _getCloudyOpacity(double value) {
    if (value < 0.2) {
      return 0;
    }

    if (value > 0.5) {
      return 1;
    }

    return 10 / 3 * value - 2 / 3;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Солнышко
    final Paint sunPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    Offset sun = const Offset(60, 0);
    canvas.drawCircle(sun, 50, sunPaint);

    // Облачка
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(_getCloudyOpacity(wether))
      ..style = PaintingStyle.fill;

    Offset circle1 = const Offset(10, 30);
    Offset circle2 = const Offset(70, 20);
    Offset circle3 = const Offset(110, 30);

    Rect myRect = const Offset(10, 0) & const Size(100, 60);

    canvas.drawRect(myRect, paint);
    canvas.drawCircle(circle1, 30, paint);
    canvas.drawCircle(circle2, 40, paint);
    canvas.drawCircle(circle3, 30, paint);

    // Дождик
    final Paint rainPaint = Paint()
      ..color = Colors.blue.withOpacity(_getDropsOpacity(wether))
      ..strokeWidth = 4;

    Offset line1s = const Offset(20, 70);
    Offset line1e = const Offset(10, 90);

    Offset line2s = const Offset(60, 70);
    Offset line2e = const Offset(50, 90);

    Offset line3s = const Offset(100, 70);
    Offset line3e = const Offset(90, 90);

    canvas.drawLine(line1s, line1e, rainPaint);
    canvas.drawLine(line2s, line2e, rainPaint);
    canvas.drawLine(line3s, line3e, rainPaint);
  }

  @override
  bool shouldRepaint(WeatherIndicator oldDelegate) => false;
}
