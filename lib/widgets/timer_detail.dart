import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/hooks/bounce_scale_animation.dart';
import 'package:timly/hooks/timer_progress_animation.dart';
import 'package:timly/model/exercise.dart';
import 'package:timly/paints/timer_progress_paint.dart';

/// Shows the given [timerState] in a visual representation
class TimerDetail extends HookWidget {
  /// The current state that should be visualized
  final TimerState timerState;

  /// The duration that should be displayed for
  /// the given [timerState]
  int get _duration {
    return timerState.maybeWhen(
        running: (exercise) => exercise.interval.inSeconds,
        setup: (setup, _) => setup.inSeconds,
        recover: (exercise) => exercise.recover.inSeconds,
        orElse: () => 0);
  }

  /// The amount of laps that should be displayed
  /// for the [timerState]
  int get _laps {
    return timerState.maybeWhen(
        running: (exercise) => exercise.laps,
        setup: (_, exercise) => exercise.laps,
        recover: (exercise) => exercise.laps,
        orElse: () => 0);
  }

  TimerDetail({@required this.timerState});

  @override
  Widget build(BuildContext context) {
    final interval = context.select((Exercise e) => e.interval);
    Duration currentInterval = timerState.remaining.interval;
    final intervalProgress =
        (currentInterval.inSeconds / interval.inSeconds) * 100.0;

    final initAnimationController =
    useAnimationController(duration: const Duration(milliseconds: 400));
    final progressAnimationController =
    useAnimationController(duration: const Duration(milliseconds: 100));

    final Animation initAnimation =
    useBounceScaleAnimation(initAnimationController);
    final Animation progressAnimation = useTimerProgressAnimation(
        controller: progressAnimationController, progress: intervalProgress);

    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          child:
          Text("${_laps}x", style: Theme.of(context).textTheme.headline6),
        ),
        Center(
            child: ScaleTransition(
              scale: initAnimation,
              child: AnimatedBuilder(
                animation: progressAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: timerState.maybeWhen(
                        recover: (_) => TimerProgressPainter.recover(),
                        orElse: () => TimerProgressPainter(
                            intervalProgress: progressAnimation.value)),
                    child: child,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                if (timerState is Recover)
                  Text('timer.pause',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.amber[300],
                              fontWeight: FontWeight.bold))
                      .tr(),
                Text("$_duration", style: Theme.of(context).textTheme.headline1)
              ],
                ),
              ),
            )),
      ],
    );
  }
}
