import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timly/bloc/burn_in/burn_in_bloc.dart';
import 'package:timly/bloc/burn_in/burn_in_state.dart';
import 'package:timly/pages/timer_page_burn_in.dart';
import 'package:timly/pages/timer_page_unconcerning.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BurnInBloc, BurnInState>(
      builder: (context, state) {
        return state.when(
            protecting: (left, top) => TimerPageBurnIn(
                  leftPadding: left,
                  topPadding: top,
                ),
            unconcerning: () => TimerPageUnconcerning());
      },
    );
  }
}
