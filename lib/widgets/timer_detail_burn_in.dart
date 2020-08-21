import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/hooks/timer_progress_animation.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/paints/timer_progress_burn_in_paint.dart';

@immutable
class TimerDetailBurnIn extends HookWidget {
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

  Duration get _duration {
    return timerState.when(
        setup: (Duration setup, _) => setup,
        running: (Exercise remaining) => remaining.interval,
        paused: (TimerState lastState, Exercise remaining) =>
            const Duration(milliseconds: 0),
        recover: (Exercise remaining) => remaining.recover,
        finished: (_) => const Duration(milliseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController progressAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 100));
    final Animation<double> progressAnimation = useTimerProgressAnimation(
        controller: progressAnimationController, progress: intervalPercentage);

    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: leftPadding),
      child: CustomPaint(
        painter: TimerProgressBurnInPaint(
            color: durationProgressColor,
            lapPercentage: progressAnimation.value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(t.timer.rounds(rounds: timerState.remaining.laps.toString()),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white)),
            Text('${_duration.inSeconds}s',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: durationTextColor)),
          ],
        ),
      ),
    );
  }
}
