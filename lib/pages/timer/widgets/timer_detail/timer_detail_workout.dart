import 'package:flutter/material.dart';
import 'package:tyme/bloc/timer/timer_state.dart';

import 'timer_detail.dart';

import '../../../../model/exercise.dart';

class TimerDetailWorkout extends TimerDetail {
  TimerDetailWorkout(BuildContext context, Exercise exercise, TimerState state)
      : super(
            durationLeft: state.remaining.inSeconds,
            laps: state.laps,
            progressIndicatorColor: Theme.of(context).primaryColor,
            progressInervalPercentage:
                state.remaining.inSeconds / exercise.interval.inSeconds);
}
