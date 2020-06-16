import 'dart:math';

import 'package:flutter/material.dart';

class TimerProgressBurnInPaint extends CustomPainter {
  final double lapPercentage;

  TimerProgressBurnInPaint({@required this.lapPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    var lapPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    if (lapPercentage != 0) {
      canvas.drawArc(new Rect.fromCircle(center: center, radius: 150), -pi / 2,
          -2 * pi * (lapPercentage / 100), false, lapPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
