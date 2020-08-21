import 'package:flutter/material.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/widgets/setup_detail.dart';
import 'package:tyme/widgets/timer_detail.dart';

@immutable
class TimerDetailUnconcerning extends StatelessWidget {
  const TimerDetailUnconcerning({@required this.state});

  final TimerState state;

  @override
  Widget build(BuildContext context) {
    if (state is Setup) {
      return SetupDetail(setupState: state as Setup);
    }

    return TimerDetail(timerState: state);
  }
}
