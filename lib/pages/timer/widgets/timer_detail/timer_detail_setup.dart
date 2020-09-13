import 'package:flutter/material.dart';
import 'package:tyme/bloc/timer/timer_state.dart';

import 'timer_detail.dart';

import '../../../../model/exercise.dart';

class TimerDetailSetup extends TimerDetail {
  TimerDetailSetup(BuildContext context, Exercise exercise, TimerState state)
      : super(
            durationLeft: state.remaining.inSeconds,
            laps: state.laps,
            progressIndicatorColor: Theme.of(context).primaryColor,
            progressInervalPercentage: state.remaining.inSeconds /
                const Duration(seconds: 5).inSeconds);
}
