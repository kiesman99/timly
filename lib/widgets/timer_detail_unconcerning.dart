import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timly/bloc/timer/timer_bloc.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/paints/timer_progress_paint.dart';

class TimerDetailUnconcerning extends StatelessWidget {
  final TimerState state;

  TimerDetailUnconcerning({@required this.state});

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.headline1;
    int laps;
    int duration;

    state.maybeWhen(running: (exercise) {
      style = style.copyWith(color: Colors.black);
      laps = exercise.laps;
      duration = exercise.interval.inSeconds;
    }, setup: (setup, exercise) {
      style = style.copyWith(color: Colors.green);
      laps = exercise.laps;
      duration = setup.inSeconds;
    }, recover: (exercise) {
      style = style.copyWith(color: Colors.red);
      laps = exercise.laps;
      duration = exercise.recover.inSeconds;
    }, orElse: () {
      laps = 0;
      duration = 0;
    });

    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          child: Text("${laps}x", style: Theme.of(context).textTheme.headline6),
        ),
        Center(
            child: CustomPaint(
          painter: TimerProgressPainter(
              lapPercentage: context.bloc<TimerBloc>().lapPercentage,
              intervalProgress: context.bloc<TimerBloc>().intervalPercentage,
              setupProgress: context.bloc<TimerBloc>().setupPercentage,
              recoverProgress: context.bloc<TimerBloc>().recoverPercentage),
          child: Text("$duration", style: style),
        )),
      ],
    );
  }
}
