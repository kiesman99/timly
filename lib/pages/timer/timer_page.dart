import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tyme/pages/timer/widgets/timer_detail/timer_detail_recover.dart';
import 'package:tyme/pages/timer/widgets/timer_detail/timer_detail_setup.dart';
import 'package:tyme/pages/timer/widgets/timer_detail/timer_detail_workout.dart';
import 'package:tyme/pages/timer/widgets/timer_finished/timer_finished.dart';
import 'package:tyme/pages/timer/widgets/timer_paused/timer_paused.dart';

import '../../bloc/blocs.dart';
import '../../bloc/timer/timer_state.dart';
import '../../model/exercise.dart';
import 'widgets/timer_detail/timer_detail.dart';

@immutable
class TimerPage extends StatelessWidget {
  const TimerPage({@required this.exercise});
  final Exercise exercise;

  static Route<void> route({
    @required Exercise exercise,
  }) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return TimerPage(exercise: exercise);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<Exercise>.value(
      value: exercise,
      child: BlocProvider<TimerBloc>(
        create: (_) => TimerBloc(exercise, OneSecondIntervalTicker()),
        child: _Page(),
      ),
    );
  }
}

@immutable
class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: TimerBloc notify touch
        // TimerBloc has to reset burnInCounter
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.watch<Exercise>().name),
        ),
        body: BlocBuilder<TimerBloc, TimerState>(
          builder: (BuildContext timerBlocContext, TimerState timerState) {
            if (timerState is Initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (timerState is Paused) {
              return TimerPaused();
            } else if (timerState is Finished) {
              return TimerFinished();
            }

            return timerDetailWithSetupState(context, timerState);
          },
        ),
        floatingActionButton: const _Fab(),
      ),
    );
  }

  TimerDetail timerDetailWithSetupState(
      BuildContext context, TimerState state) {
    var exercise = context.read<Exercise>();
    if (state is Workout) {
      return TimerDetailWorkout(context, exercise, state);
    } else if (state is Setup) {
      return TimerDetailSetup(context, exercise, state);
    } else if (state is Recover) {
      return TimerDetailRecover(exercise, state);
    }

    throw Exception('State ${state.runtimeType} was not expected.');
  }
}

@immutable
class _Fab extends StatelessWidget {
  const _Fab();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (TimerState previous, TimerState current) {
        return (previous != current) &&
            !((previous is Workout) && (current is Workout)) &&
            !((previous is Setup) && (current is Setup)) &&
            !((previous is Finished) && (current is Finished));
      },
      builder: (_, TimerState timerState) {
        // TODO: hide button when protecting mode is enabled
        if (timerState is Paused) {
          return FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () => context.bloc<TimerBloc>().add(TimerEvent.resume),
          );
        } else if (timerState is Finished) {
          return FloatingActionButton(
              child: const Icon(Icons.replay),
              onPressed: () =>
                  context.bloc<TimerBloc>().add(TimerEvent.replay));
        }

        return FloatingActionButton(
          child: const Icon(Icons.pause),
          onPressed: () => context.bloc<TimerBloc>().add(TimerEvent.pause),
        );
      },
    );
  }
}
