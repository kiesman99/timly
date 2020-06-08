
import 'package:flutter/foundation.dart';

import 'timly_state.dart';

class TimlyModel {

  int initialLaps;

  Duration duration;
  final Duration intervalDuration;
  final Duration recoverDuration;
  final Duration setupDuration;
  final int laps;
  final TimlyState state;

  TimlyModel({
    @required this.intervalDuration,
    @required this.recoverDuration,
    @required this.setupDuration,
    @required this.laps,
    this.state = TimlyState.SETUP,
    this.duration,
    this.initialLaps
  }) {
    if (initialLaps == null) {
      initialLaps = laps;
    }

    if (duration == null) {
      duration = this.setupDuration;
    }
  }

  void decrement() {
    this.duration -= const Duration(seconds: 1);
  }

  double recoverPercentage() {
    if (state == TimlyState.RECOVER) {
      return (duration.inSeconds / recoverDuration.inSeconds) * 100;
    }

    return 100.0;
  }

  double intervalPercentage() {
    if (state == TimlyState.RUNNING) {
      return (duration.inSeconds / intervalDuration.inSeconds) * 100;
    }

    return 100.0;
  }

  double setupPercentage() {
    if (state == TimlyState.SETUP) {
      return (duration.inSeconds / setupDuration.inSeconds) * 100;
    }

    return 0.0;
  }

  double lapPercentage() {
    return (laps / initialLaps ) * 100.0;
  }

  TimlyModel copyWith({
    Duration duration,
    Duration intervalDuration,
    Duration recoverDuration,
    Duration setupDuration,
    int laps,
    TimlyState state
  }) {
    return TimlyModel(
      duration: duration ?? this.duration,
      intervalDuration:  intervalDuration ?? this.intervalDuration,
      recoverDuration: recoverDuration ?? this.recoverDuration,
      setupDuration: setupDuration ?? this.setupDuration,
      laps: laps ?? this.laps,
      state: state ?? this.state,
      initialLaps: this.initialLaps
    );
  }
}