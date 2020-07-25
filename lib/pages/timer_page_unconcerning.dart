import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/bloc/timer/timer_event.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/widgets/timer_detail_unconcerning.dart';

class TimerPageUnconcerning extends StatelessWidget {
  final TimerState timerState;

  TimerPageUnconcerning({@required this.timerState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title").tr(),
      ),
      body: timerState.maybeWhen(
          paused: (_, __) => Center(
                child: Text("timer.pause",
                        style: Theme.of(context).textTheme.headline3)
                    .tr(),
              ),
          finished: (_) => Center(
            child: Text("timer.finish",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3)
                .tr(),
          ),
          orElse: () => TimerDetailUnconcerning(state: timerState)),
      floatingActionButton: timerState.maybeWhen(
        paused: (_, __) {
          return FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              context.bloc<TimerBloc>().add(TimerEvent.resume());
            },
          );
        },
        finished: (_) {
          return FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              context.bloc<TimerBloc>().add(TimerEvent.replay());
            },
          );
        },
        orElse: () {
          return FloatingActionButton(
            child: Icon(Icons.pause),
            onPressed: () {
              context.bloc<TimerBloc>().add(TimerEvent.pause());
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
