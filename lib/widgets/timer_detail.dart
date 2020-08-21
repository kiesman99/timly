import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/hooks/bounce_scale_animation.dart';
import 'package:tyme/hooks/timer_progress_animation.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/widgets/timer_progress_unconcerning_widget.dart';

/// Shows the given [timerState] in a visual representation
class TimerDetail extends HookWidget {
  /// The current state that should be visualized
  final TimerState timerState;

  /// The duration that should be displayed for
  /// the given [timerState]
  int get _duration {
    return timerState.maybeWhen(
        running: (Exercise exercise) => exercise.interval.inSeconds,
        setup: (Duration setup, _) => setup.inSeconds,
        recover: (Exercise exercise) => exercise.recover.inSeconds,
        orElse: () => 0);
  }

  /// The amount of laps that should be displayed
  /// for the [timerState]
  int get _laps {
    return timerState.maybeWhen(
        running: (Exercise exercise) => exercise.laps,
        setup: (_, Exercise exercise) => exercise.laps,
        recover: (Exercise exercise) => exercise.laps,
        orElse: () => 0);
  }

  TimerDetail({@required this.timerState});

  @override
  Widget build(BuildContext context) {
    final Duration interval = context.select((Exercise e) => e.interval);
    final Duration currentInterval = timerState.remaining.interval;
    final double intervalProgress =
        (currentInterval.inSeconds / interval.inSeconds) * 100.0;

    final AnimationController initAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 400));
    final AnimationController progressAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 100));

    final Animation<double> initAnimation =
        useBounceScaleAnimation(initAnimationController);
    final Animation<double> progressAnimation = useTimerProgressAnimation(
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
              if (timerState is Recover) {
                return TimerProgressUnconcerningWidget.recover(
                  text: _duration.toString(),
                );
              }

              return TimerProgressUnconcerningWidget(
                intervalProgress: progressAnimation.value,
                text: _duration.toString(),
              );
            },
          ),
        )),
      ],
    );
  }
}
