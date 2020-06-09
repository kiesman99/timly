import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timly/bloc/sound/sound_bloc.dart';
import 'package:timly/bloc/sound/sound_event.dart';
import 'package:timly/bloc/timer/timer_event.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/model/timly_model.dart';

// TODO: Remove all copyWith Statements. Implement functions for these calls.
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  SoundBloc _soundBloc;

  Timer _timer;

  final TimlyModel _initial;
  TimlyModel _remaining;

  TimerBloc(this._initial, this._soundBloc) {
    if (_timer == null) {
      _timer = Timer.periodic(
          const Duration(milliseconds: 1000), (_) => _tickHandler());
    }
    if (_remaining == null) {
      _remaining = _initial;
    }
  }

  @override
  TimerState get initialState => TimerState.setup(_initial);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    yield* event.when(
        setupTick: () => mapSetupEventToState(event),
        runningTick: () => mapRunningEventToState(event),
        recoverTick: () => mapRecoverEventToState(event),
        pause: () => mapPauseEventToState(event),
        resume: () => mapResumeEventToState(event),
        replay: () => mapReplayEventToState(event));
  }

  Stream<TimerState> mapReplayEventToState(Replay event) async* {
    _timer?.cancel();
    _remaining = _initial;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tickHandler());
    yield TimerState.setup(_remaining);
  }

  Stream<TimerState> mapSetupEventToState(SetupTick event) async* {
    if ([1, 2].contains(_remaining.setupDuration.inSeconds)) {
      _soundBloc.add(SoundEvent.longBeep());
    }
    if (_remaining.setupDuration.inSeconds == 1) {
      yield TimerState.running(_remaining);
    } else {
      _remaining = _remaining.copyWith(
          setupDuration: _remaining.setupDuration - const Duration(seconds: 1));
      yield TimerState.setup(_remaining);
    }
  }

  Stream<TimerState> mapRunningEventToState(RunningTick event) async* {
    if (_remaining.laps == 0) {
      yield TimerState.finished();
    } else {
      if (_remaining.intervalDuration.inSeconds == 1) {
        _soundBloc.add(SoundEvent.longBeep());
        _remaining =
            _remaining.copyWith(intervalDuration: _initial.intervalDuration);
        yield TimerState.recover(_remaining);
      } else {
        _remaining = _remaining.copyWith(
            intervalDuration:
                _remaining.intervalDuration - const Duration(seconds: 1));
        yield TimerState.running(_remaining);
      }
    }
  }

  Stream<TimerState> mapRecoverEventToState(RecoverTick event) async* {
    if (_remaining.recoverDuration.inSeconds == 1) {
      _remaining = _remaining.copyWith(
          recoverDuration: _initial.recoverDuration, laps: _remaining.laps - 1);
      yield TimerState.running(_remaining);
    } else {
      // TODO: implement sounds
      if ([2,3].contains(_remaining.recoverDuration.inSeconds)) {
        _soundBloc.add(SoundEvent.shortBeep());
      } else if (_remaining.recoverDuration.inSeconds == 1) {
        _soundBloc.add(SoundEvent.longBeep());
      }
      _remaining = _remaining.copyWith(
          recoverDuration:
              _remaining.recoverDuration - const Duration(seconds: 1));
      yield TimerState.recover(_remaining);
    }
  }

  Stream<TimerState> mapPauseEventToState(Pause event) async* {
    _timer.cancel();
    _timer = null;
    yield TimerState.paused(state);
  }

  Stream<TimerState> mapResumeEventToState(Resume event) async* {
    if (state is Paused) {
      yield (state as Paused).lastState;
      if (_timer == null) {
        _timer = new Timer.periodic(
            const Duration(milliseconds: 1000), (_) => _tickHandler());
      }
    }
  }

  /// This function will handle the different ticks
  /// which are invoked each second by the [_timer]
  void _tickHandler() {
    state.maybeWhen(
        setup: (_) => add(TimerEvent.setupTick()),
        running: (_) => add(TimerEvent.runningTick()),
        recover: (_) => add(TimerEvent.recoverTick()),
        orElse: () {} // event was not a tick
        );
  }

  @override
  Future<void> close() {
    _timer.cancel();
    _timer = null;
    return super.close();
  }

  double get intervalPercentage {
    return (_remaining.intervalDuration.inSeconds / _initial.intervalDuration.inSeconds) * 100;
  }

  double get recoverPercentage {
    return (_remaining.recoverDuration.inSeconds / _initial.recoverDuration.inSeconds) * 100.0;
  }

  double get lapPercentage {
    return (_remaining.laps / _initial.laps) * 100.0;
  }

  double get setupPercentage {
    if (_remaining.setupDuration.inSeconds == 1) {
      return 0.0;
    }
    return (_remaining.setupDuration.inSeconds / _initial.setupDuration.inSeconds) * 100.0;
  }
}
