import 'dart:math';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:meta/meta.dart';

class TimerProgressPainter extends CustomPainter {
  TimerProgressPainter(
      {@required this.intervalProgress,
      @required this.indicatorColor,
      this.durationLeft = ''});

  /// Interval Progress from 0 to 100
  final double intervalProgress;

  /// The color for the progress indicator
  final Color indicatorColor;

  final String durationLeft;

  static const double _progressbarWidth = 15.0;
  static const double _horizontalPadding = 20.0;

  Paint get _intervalPaint => Paint()
    ..color = indicatorColor
    ..strokeWidth = _progressbarWidth
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  Paint get _backgroundPaint => Paint()
    ..color = indicatorColor.darker(35)
    ..strokeWidth = _progressbarWidth
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    var radius = (min(size.width, size.height) / 2) -
        (_progressbarWidth + _horizontalPadding);

    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        -2 * pi, false, _backgroundPaint);

    // if (intervalProgress != 0) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        -2 * pi * intervalProgress, false, _intervalPaint);
    // }

    var textSpan =
        TextSpan(text: durationLeft, style: TextStyle(fontSize: 1.0));

    var textPainter = TextPainter(
        textDirection: TextDirection.ltr, text: textSpan, maxLines: 1);
    textPainter.layout(minWidth: 0);
    var scaleFactor = (radius / 1.5) / textPainter.height;
    textPainter.textScaleFactor = scaleFactor;
    textPainter.layout(minWidth: 0);

    textPainter.paint(
        canvas,
        Offset(center.dx - (textPainter.width / 2),
            center.dy - (textPainter.height / 2)));
  }

  @override
  bool shouldRepaint(TimerProgressPainter oldDelegate) {
    return intervalProgress != oldDelegate.intervalProgress ||
        indicatorColor != oldDelegate.indicatorColor;
  }
}
