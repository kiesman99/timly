import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timly/model/timly_model.dart';

part 'timer_state.freezed.dart';

@freezed
abstract class TimerState with _$TimerState {
  // TODO: make [remaining] accessable from every TimerState
  const factory TimerState.setup(TimlyModel remaining) = Setup;

  const factory TimerState.running(TimlyModel remaining) = Running;

  const factory TimerState.paused(TimerState lastState) = Paused;

  const factory TimerState.recover(TimlyModel remaining) = Recover;

  const factory TimerState.finished() = Finished;
}
