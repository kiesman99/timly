import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/widgets/timer_progress_unconcerning_widget.dart';

class TimerDetail extends StatefulWidget {
  const TimerDetail({@required this.timerState});
  final TimerState timerState;
  @override
  _TimerDetailState createState() => _TimerDetailState();
}

class _TimerDetailState extends State<TimerDetail> {
  /// The duration that should be displayed for
  /// the given [timerState]
  int get _duration {
    return widget.timerState.maybeWhen(
        running: (Exercise exercise) => exercise.interval.inSeconds,
        setup: (Duration setup, _) => setup.inSeconds,
        recover: (Exercise exercise) => exercise.recover.inSeconds,
        orElse: () => 0);
  }

  /// The amount of laps that should be displayed
  /// for the [timerState]
  int get _laps {
    return widget.timerState.maybeWhen(
        running: (Exercise exercise) => exercise.laps,
        setup: (_, Exercise exercise) => exercise.laps,
        recover: (Exercise exercise) => exercise.laps,
        orElse: () => 0);
  }

  @override
  Widget build(BuildContext context) {
    final Duration interval = context.select((Exercise e) => e.interval);
    final Duration currentInterval = widget.timerState.remaining.interval;
    final double intervalProgress =
        (currentInterval.inSeconds / interval.inSeconds) * 100.0;

    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          child:
              Text('${_laps}x', style: Theme.of(context).textTheme.headline6),
        ),
        Center(
          child: TimerProgressUnconcerningWidget(
            text: _duration.toString(),
            isRecover: widget.timerState is Recover,
          ),
        ),
      ],
    );
  }
}
