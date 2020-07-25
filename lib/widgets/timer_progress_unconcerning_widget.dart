import 'package:flutter/material.dart';
import 'package:tyme/paints/timer_progress_paint.dart';
import 'package:easy_localization/easy_localization.dart';

@immutable
class TimerProgressUnconcerningWidget extends StatelessWidget {
  final String text;
  final double intervalProgress;
  final double radiusPercentage;
  final bool _isRecover;

  TimerProgressUnconcerningWidget(
      {this.text, this.intervalProgress = 100.0, this.radiusPercentage = 1.0})
      : _isRecover = false;

  TimerProgressUnconcerningWidget.recover(
      {this.text, this.radiusPercentage = 1.0})
      : _isRecover = true, intervalProgress = 100.0;

  Widget _buildChild(BuildContext context) {
    if (!_isRecover) {
      return Center(
        child: Text("$text", style: Theme.of(context).textTheme.headline1),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('timer.pause',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.amber[300],
                    fontWeight: FontWeight.bold))
            .tr(),
        Text("$text", style: Theme.of(context).textTheme.headline1)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isRecover) {
      return CustomPaint(
        painter: TimerProgressPainter.recover(
            radiusPercentage: radiusPercentage),
        child: _buildChild(context),
      );
    }

    return CustomPaint(
      painter: TimerProgressPainter(
          intervalProgress: intervalProgress,
          radiusPercentage: radiusPercentage),
      child: _buildChild(context),
    );
  }
}
