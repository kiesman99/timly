import 'package:flutter/material.dart';
import 'package:tyme/pages/timer/widgets/timer_progress/timer_progress_paint.dart';

@immutable
class TimerProgress extends StatelessWidget {
  const TimerProgress(
      {@required this.durationLeft,
      @required this.intervalProgress,
      @required this.indicatorColor});
  final double intervalProgress;
  final Color indicatorColor;
  final String durationLeft;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: TimerProgressPainter(
              indicatorColor: indicatorColor,
              intervalProgress: intervalProgress,
              durationLeft: durationLeft),
        );
      },
    );
  }
}
