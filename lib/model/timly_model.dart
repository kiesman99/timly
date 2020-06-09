import 'package:flutter/foundation.dart';

class TimlyModel {
  final Duration intervalDuration;
  final Duration recoverDuration;
  final Duration setupDuration;
  final int laps;

  TimlyModel({
    @required this.intervalDuration,
    @required this.recoverDuration,
    @required this.setupDuration,
    @required this.laps,
  });

  TimlyModel copyWith({
    Duration intervalDuration,
    Duration recoverDuration,
    Duration setupDuration,
    int laps,
  }) {
    return TimlyModel(
        intervalDuration: intervalDuration ?? this.intervalDuration,
        recoverDuration: recoverDuration ?? this.recoverDuration,
        setupDuration: setupDuration ?? this.setupDuration,
        laps: laps ?? this.laps);
  }
}
