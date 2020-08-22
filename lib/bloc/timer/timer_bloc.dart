import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/timer/timer_event.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/service/tts_service.dart';
import 'package:tyme/utils/custom_timer.dart';
import 'package:tyme/utils/device.dart';
import 'package:tyme/utils/logger.dart';
import 'package:tyme/utils/real_timer.dart';
import 'package:wakelock/wakelock.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> with LoggerMixin {
  TimerBloc(
    this._initial, [
    TTSService _ttsService,
    this._customTimer,
    // TODO: get from SettingsBloc
    this._initialSetupDuration = const Duration(seconds: 5),
  ]) : super(TimerState.setup(_initialSetupDuration, _initial)) {
    if (Device.isMobile) {
      Wakelock.enable();
    }

    loggerNS.d('Creating new TimerBloc');
    if (_customTimer == null) {
      _customTimer = RealTimer(interval: const Duration(seconds: 1));
    } else {
      loggerNS.d('Using custom Timer: ${_customTimer.runtimeType}');
    }
    this._ttsService = _ttsService ?? TTSService();
    _customTimer.callback = () => add(const TimerEvent.ticked());
    _customTimer.start();
  }

  final Duration _initialSetupDuration;

  /// The timer used to produce a tick each
  /// second. It'll invoke [_tickHandler]
  CustomTimer _customTimer;

  /// The initial [Exercise] the [TimerBloc] was
  /// started with.
  final Exercise _initial;

  TTSService _ttsService;

  @override
  void onEvent(TimerEvent event) {
    _ttsService.speakFromState(state);
    super.onEvent(event);
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    yield* event.when(
      ticked: _mapTickedEventToState,
      pause: _mapPauseEventToState,
      resume: _mapResumeEventToState,
      replay: _mapReplayEventToState,
    );
  }

  Stream<TimerState> _mapTickedEventToState() async* {
    yield* state.maybeWhen(
      setup: _mapSetupTickToState,
      running: _mapRunningTickToState,
      recover: _mapRecoverTickToState,
      orElse: () async* {},
    );
  }

  /// Gets invoked if a [SetupTick] event hits the [TimerBloc]
  ///
  /// This function will either yield a [Running] state if the setup is done
  /// or yield a [Setup] state with one second setup duration less, if
  /// the setup has time remaining.
  Stream<TimerState> _mapSetupTickToState(
    Duration setupDuration,
    Exercise remaining,
  ) async* {
    loggerNS.d("Setup Tick: $setupDuration");
    if (setupDuration.inSeconds == 1) {
      yield TimerState.running(remaining);
    } else {
      yield TimerState.setup(
        setupDuration - const Duration(seconds: 1),
        remaining,
      );
    }
  }

  /// Gets invoked if a [RunningTick] event hits the [TimerBloc]
  ///
  /// If no [_remaining.laps] are left the function will yield a [Finished] state
  ///
  /// Else if the function will decrease the [_remaining.interval] or
  /// yield an [Recover] state to start decreasing the [_remaining.recover]
  Stream<TimerState> _mapRunningTickToState(Exercise remaining) async* {
    if (remaining.laps == 0) {
      yield TimerState.finished(remaining);
    } else if (remaining.interval.inSeconds == 1) {
      yield TimerState.recover(remaining.copyWith(interval: _initial.interval));
    } else {
      yield TimerState.running(remaining.copyWith(
        interval: remaining.interval - const Duration(seconds: 1),
      ));
    }
  }

  /// Gets invoked if a [RecoverTick] event hits the [TimerBloc]
  ///
  /// If there is no [remaining.recover] left it get's resetted and
  /// [Running] is yielded to start decreasing [remaining.interval] again
  ///
  /// else it decreases the [remaining.recover] and yield a [Recover] State
  Stream<TimerState> _mapRecoverTickToState(Exercise remaining) async* {
    if (remaining.recover.inSeconds == 1) {
      yield TimerState.running(remaining.copyWith(
        laps: remaining.laps - 1,
        recover: _initial.recover,
      ));
    } else {
      yield TimerState.recover(remaining.copyWith(
        recover: remaining.recover - const Duration(seconds: 1),
      ));
    }
  }

  /// Gets invoked if a [Pause] event hits the [TimerBloc]
  ///
  /// This function will stop the [_timer]
  Stream<TimerState> _mapPauseEventToState() async* {
    _customTimer.stop();
    yield TimerState.paused(state, state.remaining);
  }

  /// Gets invoked if a [Resume] event hits the [TimerBloc]
  ///
  /// If the previous state was [Pause] it'll restart the timer
  /// so that each second the [_tickHandler] gets invoked
  Stream<TimerState> _mapResumeEventToState() async* {
    if (state is Paused) {
      yield (state as Paused).lastState;
      _customTimer.start();
    }
  }

  /// Gets invoked if a [Replay] event hits the [TimerBloc]
  ///
  /// This function will reset the [_remaining] to [_initial]
  /// and restart the timer
  Stream<TimerState> _mapReplayEventToState() async* {
    _customTimer.stop();
    _customTimer.start();
    yield TimerState.setup(_initialSetupDuration, _initial);
  }

  @override
  Future<void> close() {
    loggerNS.d('Closing TimerBloc');
    _customTimer.stop();
    if (Device.isMobile) {
      Wakelock.disable();
    }
    return super.close();
  }
}
