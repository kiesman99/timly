import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timly/bloc/sound/sound_bloc.dart';
import 'package:timly/bloc/sound/sound_event.dart';
import 'package:timly/bloc/timer/timer_event.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/model/exercise.dart';

// TODO: get from SettingsBloc
const _initialSetupDuration = Duration(seconds: 5);

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Duration _setupDuration = _initialSetupDuration;

  SoundBloc _soundBloc;

  Timer _timer;

  final Exercise _initial;
  Exercise _remaining;

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
  TimerState get initialState => TimerState.setup(_setupDuration, _initial);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    yield* event.when(
        setupTick: () => _mapSetupEventToState(event),
        runningTick: () => _mapRunningEventToState(event),
        recoverTick: () => _mapRecoverEventToState(event),
        pause: () => _mapPauseEventToState(event),
        resume: () => _mapResumeEventToState(event),
        replay: () => _mapReplayEventToState(event));
  }

  Stream<TimerState> _mapReplayEventToState(Replay event) async* {
    _timer?.cancel();
    _remaining = _initial;
    _setupDuration = _initialSetupDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tickHandler());
    yield TimerState.setup(_setupDuration, _remaining);
  }

  Stream<TimerState> _mapSetupEventToState(SetupTick event) async* {
    if ([1, 2].contains(_setupDuration.inSeconds)) {
      _soundBloc.add(SoundEvent.longBeep());
    }
    if (_setupDuration.inSeconds == 1) {
      yield TimerState.running(_remaining);
    } else {
      _setupDuration -= const Duration(seconds: 1);
      yield TimerState.setup(_setupDuration, _remaining);
    }
  }

  Stream<TimerState> _mapRunningEventToState(RunningTick event) async* {
    if (_remaining.laps == 0) {
      yield TimerState.finished();
    } else {
      if (_remaining.interval.inSeconds == 1) {
        _soundBloc.add(SoundEvent.longBeep());
        _remaining.interval = _initial.interval;
        yield TimerState.recover(_remaining);
      } else {
        _remaining.interval = _remaining.interval - const Duration(seconds: 1);
        yield TimerState.running(_remaining);
      }
    }
  }

  Stream<TimerState> _mapRecoverEventToState(RecoverTick event) async* {
    if (_remaining.recover.inSeconds == 1) {
      _remaining.recover = _initial.recover;
      _remaining.laps = _remaining.laps - 1;
      yield TimerState.running(_remaining);
    } else {
      // TODO: implement sounds
      if ([2, 3].contains(_remaining.recover.inSeconds)) {
        _soundBloc.add(SoundEvent.shortBeep());
      } else if (_remaining.recover.inSeconds == 1) {
        _soundBloc.add(SoundEvent.longBeep());
      }
      _remaining.recover = _remaining.recover - const Duration(seconds: 1);
      yield TimerState.recover(_remaining);
    }
  }

  Stream<TimerState> _mapPauseEventToState(Pause event) async* {
    _timer.cancel();
    _timer = null;
    yield TimerState.paused(state);
  }

  Stream<TimerState> _mapResumeEventToState(Resume event) async* {
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
        setup: (_, __) => add(TimerEvent.setupTick()),
        running: (_) => add(TimerEvent.runningTick()),
        recover: (_) => add(TimerEvent.recoverTick()),
        orElse: () {} // event was not a tick
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    return super.close();
  }

  double get intervalPercentage {
    return (_remaining.interval.inSeconds / _initial.interval.inSeconds) * 100;
  }

  double get recoverPercentage {
    return (_remaining.recover.inSeconds / _initial.recover.inSeconds) * 100.0;
  }

  double get lapPercentage {
    return (_remaining.laps / _initial.laps) * 100.0;
  }

  double get setupPercentage {
    if (_setupDuration.inSeconds == 1) {
      return 0.0;
    }
    return (_setupDuration.inSeconds / _initialSetupDuration.inSeconds) * 100.0;
  }
}
