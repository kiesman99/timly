import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/paints/timer_progress_burn_in_paint.dart';

class TimerDetailBurnIn extends StatefulWidget {
  const TimerDetailBurnIn(
      {@required this.intervalPercentage,
      @required this.leftPadding,
      @required this.topPadding,
      @required this.timerState,
      this.durationTextColor = Colors.white,
      this.durationProgressColor = Colors.white});

  const TimerDetailBurnIn.recover(
      {@required this.intervalPercentage,
      @required this.leftPadding,
      @required this.topPadding,
      @required this.timerState,
      this.durationTextColor = Colors.amber,
      this.durationProgressColor = Colors.amber});
  final TimerState timerState;
  final double intervalPercentage;
  final double leftPadding;
  final double topPadding;
  final Color durationTextColor;
  final Color durationProgressColor;
  @override
  _TimerDetailBurnInState createState() => _TimerDetailBurnInState();
}

class _TimerDetailBurnInState extends State<TimerDetailBurnIn> {
  Duration get _duration {
    return widget.timerState.when(
        setup: (Duration setup, _) => setup,
        running: (Exercise remaining) => remaining.interval,
        paused: (TimerState lastState, Exercise remaining) =>
            const Duration(milliseconds: 0),
        recover: (Exercise remaining) => remaining.recover,
        finished: (_) => const Duration(milliseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: widget.topPadding, left: widget.leftPadding),
      child: CustomPaint(
        painter: TimerProgressBurnInPaint(
            color: widget.durationProgressColor, lapPercentage: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                t.timer.rounds(
                    rounds: widget.timerState.remaining.laps.toString()),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white)),
            Text('${_duration.inSeconds}s',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: widget.durationTextColor)),
          ],
        ),
      ),
    );
  }
}
