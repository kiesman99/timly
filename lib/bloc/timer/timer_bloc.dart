import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timly/bloc/sound/sound_bloc.dart';
import 'package:timly/bloc/sound/sound_event.dart';
import 'package:timly/bloc/timer/timer_event.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/model/exercise.dart';
import 'package:wakelock/wakelock.dart';

// TODO: get from SettingsBloc
const _initialSetupDuration = Duration(seconds: 5);

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Duration _setupDuration = _initialSetupDuration;

  /// The bloc which handles playing sound
  SoundBloc _soundBloc;

  /// The timer used to produce a tick each
  /// second. It'll invoke [_tickHandler]
  Timer _timer;

  /// The initial [Exercise] the [TimerBloc] was
  /// started with.
  final Exercise _initial;

  /// Used to store how much time of the [_initial]
  /// exercise is left over
  Exercise _remaining;

  TimerBloc(this._initial, this._soundBloc) {
    Wakelock.enable();
    if (_remaining == null) {
      _remaining = Exercise(
          laps: _initial.laps,
          recover: _initial.recover,
          interval: _initial.interval,
          name: _initial.name);
    }
    if (_timer == null) {
      _timer = Timer.periodic(
          const Duration(milliseconds: 1000), (_) => _tickHandler());
    }
  }

  @override
  TimerState get initialState => TimerState.setup(_setupDuration, _initial);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    var i = event.when(
        setupTick: () => _mapSetupEventToState(event),
        runningTick: () => _mapRunningEventToState(event),
        recoverTick: () => _mapRecoverEventToState(event),
        pause: () => _mapPauseEventToState(event),
        resume: () => _mapResumeEventToState(event),
        replay: () => _mapReplayEventToState(event));

    yield* i;
    //print("Remaining:\t$_remaining");
    //print("Initial:\t$_initial");
  }

  /// This function will handle the different ticks
  /// which are invoked each second by the [_timer]
  void _tickHandler() {
    state.maybeWhen(
        setup: (_, __) => add(TimerEvent.setupTick()),
        running: (_) => add(TimerEvent.runningTick()),
        recover: (_) => add(TimerEvent.recoverTick()),
        finished: () {
          // TODO: add finish Event to stop timer
        },
        orElse: () {
          print("Something else!");
        } // event was not a tick
    );
  }

  /// Gets invoked if a [SetupTick] event hits the [TimerBloc]
  ///
  /// This function will either yield a [Running] state if the setup is done
  /// or yield a [Setup] state with one second setup duration less, if
  /// the setup has time remaining.
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

  /// Gets invoked if a [RunningTick] event hits the [TimerBloc]
  ///
  /// If no [_remaining.laps] are left the function will yield a [Finished] state
  ///
  /// Else if the function will decrease the [_remaining.interval] or
  /// yield an [Recover] state to start decreasing the [_remaining.recover]
  Stream<TimerState> _mapRunningEventToState(RunningTick event) async* {
    if (_remaining.laps == 0) {
      yield TimerState.finished();
    } else if (_remaining.interval.inSeconds == 1) {
      _soundBloc.add(SoundEvent.longBeep());
      _remaining.interval = _initial.interval;
      yield TimerState.recover(_remaining);
    } else {
      _remaining = _remaining.copyWith(
          interval: _remaining.interval - const Duration(seconds: 1));
      yield TimerState.running(_remaining);
    }
  }

  /// Gets invoked if a [RecoverTick] event hits the [TimerBloc]
  ///
  /// If there is no [_remaining.recover] left it get's resetted and
  /// [Running] is yielded to start decreasing [_remaining.interval] again
  ///
  /// else it decreases the [_remaining.recover] and yield a [Recover] State
  Stream<TimerState> _mapRecoverEventToState(RecoverTick event) async* {
    if (_remaining.recover.inSeconds == 1) {
      _remaining = _remaining.copyWith(
          laps: _remaining.laps - 1, recover: _initial.recover);
      yield TimerState.running(_remaining);
    } else {
      if ([2, 3].contains(_remaining.recover.inSeconds)) {
        _soundBloc.add(SoundEvent.shortBeep());
      } else if (_remaining.recover.inSeconds == 1) {
        _soundBloc.add(SoundEvent.longBeep());
      }
      _remaining = _remaining.copyWith(
          recover: _remaining.recover - const Duration(seconds: 1));
      yield TimerState.recover(_remaining);
    }
  }

  /// Gets invoked if a [Pause] event hits the [TimerBloc]
  ///
  /// This function will stop the [_timer]
  Stream<TimerState> _mapPauseEventToState(Pause event) async* {
    _timer?.cancel();
    _timer = null;
    yield TimerState.paused(state);
  }

  /// Gets invoked if a [Resume] event hits the [TimerBloc]
  ///
  /// If the previous state was [Pause] it'll restart the timer
  /// so that each second the [_tickHandler] gets invoked
  Stream<TimerState> _mapResumeEventToState(Resume event) async* {
    if (state is Paused) {
      yield (state as Paused).lastState;
      if (_timer == null) {
        _timer = new Timer.periodic(
            const Duration(milliseconds: 1000), (_) => _tickHandler());
      }
    }
  }

  /// Gets invoked if a [Replay] event hits the [TimerBloc]
  ///
  /// This function will reset the [_remaining] to [_initial]
  /// and restart the timer
  Stream<TimerState> _mapReplayEventToState(Replay event) async* {
    _timer?.cancel();
    _remaining = Exercise(laps: _initial.laps,
        recover: _initial.recover,
        interval: _initial.interval,
        name: _initial.name);
    _setupDuration = _initialSetupDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tickHandler());
    yield TimerState.setup(_setupDuration, _remaining);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    Wakelock.disable();
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
