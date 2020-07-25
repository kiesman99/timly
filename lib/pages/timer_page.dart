import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/burn_in/burn_in_state.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/pages/timer_page_burn_in.dart';
import 'package:tyme/pages/timer_page_unconcerning.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, timerState) {
        return BlocBuilder<BurnInBloc, BurnInState>(
          builder: (context, state) {
            return state == null ? Text("failed") : state.when(
                protecting: (left, top) => TimerPageBurnIn(
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
