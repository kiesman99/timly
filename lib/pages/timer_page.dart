import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/burn_in/burn_in_state.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/timer_page_burn_in.dart';
import 'package:tyme/pages/timer_page_unconcerning.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BurnInBloc>(
            create: (_) => BurnInBloc(),
          ),
          BlocProvider<TimerBloc>(
            create: (_) => TimerBloc(exercise),
          )
        ],
        child: _ActualTimerPage(),
      ),
    );
  }
}

class _ActualTimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (BuildContext context, TimerState timerState) {
        return BlocBuilder<BurnInBloc, BurnInState>(
          builder: (BuildContext context, BurnInState state) {
            return state == null
                ? const Text('failed')
                : state.when(
                    protecting: (double left, double top) => TimerPageBurnIn(
                          leftPadding: left,
                          topPadding: top,
                          timerState: timerState,
                        ),
                    unconcerning: () =>
                        TimerPageUnconcerning(timerState: timerState));
          },
        );
      },
    );
  }
}
