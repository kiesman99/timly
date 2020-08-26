import 'package:flutter/material.dart';
import 'package:tyme/bloc/timer/timer_state.dart';

import 'timer_detail.dart';

import '../../../../model/exercise.dart';

class TimerDetailRecover extends TimerDetail {
  TimerDetailRecover(Exercise exercise, TimerState state)
      : super(
            durationLeft: state.remaining.inSeconds,
            laps: state.laps,
            progressIndicatorColor: Colors.amber,
            progressInervalPercentage:
                state.remaining.inSeconds / exercise.recover.inSeconds);
}
