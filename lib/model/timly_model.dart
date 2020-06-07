
import 'package:flutter/foundation.dart';

import 'TimlyState.dart';

class TimlyModel {

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
    this.duration
  }) {
    if (duration == null) {
      duration = this.setupDuration;
    }
  }

  void decrement() {
    this.duration -= const Duration(seconds: 1);
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
      state: state ?? this.state
    );
  }
}