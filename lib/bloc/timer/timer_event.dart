import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_event.freezed.dart';

@freezed
abstract class TimerEvent with _$TimerEvent {
  const factory TimerEvent.setupTick() = SetupTick;

  const factory TimerEvent.runningTick() = RunningTick;

  const factory TimerEvent.recoverTick() = RecoverTick;

  const factory TimerEvent.pause() = Pause;

  const factory TimerEvent.resume() = Resume;
}
