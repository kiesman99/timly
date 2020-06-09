import 'dart:math';

import 'package:flutter/material.dart';

class TimerProgressPainter extends CustomPainter {
  /// Setup Progress from 0 to 100
  final double setupProgress;

  /// Recover Progress from 0 to 100
  final double recoverProgress;

  /// Interval Progress from 0 to 100
  final double intervalProgress;

  /// Lap Progress from 0 to 100
  final double lapPercentage;

  TimerProgressPainter(
      {@required this.setupProgress,
      @required this.recoverProgress,
      @required this.intervalProgress,
      @required this.lapPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    var setupPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 40.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var lapPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 35.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var recoverPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 30.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var intervalPaint = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    if (setupProgress != 0) {
      canvas.drawArc(new Rect.fromCircle(center: center, radius: 250), -pi / 2,
          -2 * pi * (setupProgress / 100), false, setupPaint);
    }

    if (lapPercentage != 0) {
      canvas.drawArc(new Rect.fromCircle(center: center, radius: 200), -pi / 2,
          -2 * pi * (lapPercentage / 100), false, lapPaint);
    }

    if (recoverProgress != 0) {
      canvas.drawArc(new Rect.fromCircle(center: center, radius: 140), -pi / 2,
          -2 * pi * (recoverProgress / 100), false, recoverPaint);
    }

    if (intervalProgress != 0) {
      canvas.drawArc(new Rect.fromCircle(center: center, radius: 90), -pi / 2,
          -2 * pi * (intervalProgress / 100), false, intervalPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
