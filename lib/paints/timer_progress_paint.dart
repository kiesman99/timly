import 'dart:math';

import 'package:flutter/material.dart';

class TimerProgressPainter extends CustomPainter {
  /// Interval Progress from 0 to 100
  final double intervalProgress;
  final double radiusPercentage;

  final MaterialColor _color;

  TimerProgressPainter(
      {@required this.intervalProgress, this.radiusPercentage = 1.0})
      : this._color = Colors.teal;

  TimerProgressPainter.recover(
      {this.intervalProgress = 100.0, this.radiusPercentage = 1.0})
      : this._color = Colors.amber;

  @override
  void paint(Canvas canvas, Size size) {
    var backgroundPaint = Paint()
      ..color = _color[800]
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var intervalPaint = Paint()
      ..color = _color[300]
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(new Rect.fromCircle(center: center, radius: 150), -pi / 2,
        -2 * pi, false, backgroundPaint);

    if (intervalProgress != 0) {
      canvas.drawArc(
          new Rect.fromCircle(center: center, radius: 150 * radiusPercentage),
          -pi / 2,
          -2 * pi * (intervalProgress / 100),
          false,
          intervalPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
