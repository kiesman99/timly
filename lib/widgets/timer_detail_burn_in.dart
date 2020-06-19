import 'package:flutter/material.dart';
import 'package:timly/paints/timer_progress_burn_in_paint.dart';

class TimerDetailBurnIn extends StatelessWidget {
  final double lapPercentage;
  final int laps;
  final Duration duration;
  final double leftPadding;
  final double topPadding;
  final Color durationTextColor;

  TimerDetailBurnIn(
      {@required this.lapPercentage,
      @required this.laps,
      @required this.duration,
      @required this.leftPadding,
      @required this.topPadding,
      this.durationTextColor = Colors.white});

  TimerDetailBurnIn.recover(
      {@required this.lapPercentage,
      @required this.laps,
      @required this.duration,
      @required this.leftPadding,
      @required this.topPadding,
      this.durationTextColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: leftPadding),
      child: CustomPaint(
        painter: TimerProgressBurnInPaint(lapPercentage: this.lapPercentage),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Runden: $laps',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white)),
            Text('${duration.inSeconds}s',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: durationTextColor)),
          ],
        ),
      ),
    );
  }
}
