import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';

import '../../model/exercise.dart';
import 'interval_ticker.dart';
import 'timer_event.dart';
import 'timer_state.dart';

const _setupDuration = Duration(seconds: 5);

/// {@template timer_bloc}
/// {@endtempalte}
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  /// {@macro timer_bloc}
  TimerBloc(this._exercise, this._ticker)
      : assert(_exercise != null),
        super(Initial(_exercise)) {
    tickerSubsciption = _ticker.tickStream.listen((_) {
      add(TimerEvent.timerTicked);
    });
    add(TimerEvent.start);
  }

  final Exercise _exercise;

  final IntervalTicker _ticker;

  @visibleForTesting
  StreamSubscription<Tick> tickerSubsciption;

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event == TimerEvent.start) {
      _startTimer();
    } else if (event == TimerEvent.timerTicked) {
      yield* _mapTimerTickToFunctionHandler(event);
    } else if (event == TimerEvent.pause) {
      yield* _mapPauseEventToState();
    } else if (event == TimerEvent.resume) {
      yield* _mapResumeEventToState();
    } else if (event == TimerEvent.replay) {
      yield* _mapReplayEventToState();
    }
  }

  void _startTimer() {
    _ticker.start();
  }

  Stream<TimerState> _mapTimerTickToFunctionHandler(TimerEvent event) async* {
    if (state is Initial) {
      yield* _startSetup();
    } else if (state is Setup) {
      yield* _mapSetupTickToState();
    } else if (state is Workout) {
      yield* _mapIntervalTickToState();
    } else if (state is Recover) {
      yield* _mapRecoverTickToState();
    }
  }

  Stream<TimerState> _startSetup() async* {
    yield Setup(_exercise.laps, _setupDuration);
  }

  Stream<TimerState> _mapSetupTickToState() async* {
    if (state.remaining == 1.seconds) {
      yield Workout(state.laps, _exercise.interval);
    } else {
      yield Setup(state.laps, state.remaining - 1.seconds);
    }
  }

  Stream<TimerState> _mapIntervalTickToState() async* {
    if (state.remaining == 1.seconds) {
      if (state.laps == 1) {
        yield Finished();
      } else {
        yield Recover(state.laps, _exercise.recover);
      }
    } else {
      yield Workout(state.laps, state.remaining - 1.seconds);
    }
  }

  Stream<TimerState> _mapRecoverTickToState() async* {
    if (state.remaining == 1.seconds) {
      yield Workout(state.laps - 1, _exercise.interval);
    } else {
      yield Recover(state.laps, state.remaining - 1.seconds);
    }
  }

  Stream<TimerState> _mapPauseEventToState() async* {
    _ticker.stop();
    yield Paused(state);
  }

  Stream<TimerState> _mapResumeEventToState() async* {
    if (state is Paused) {
      yield (state as Paused).lastState;
      _ticker.start();
    }
  }

  Stream<TimerState> _mapReplayEventToState() async* {
    _ticker.stop();
    yield Setup(_exercise.laps, _setupDuration);
    _ticker.start();
  }

  @override
  Future<void> close() {
    tickerSubsciption.cancel();
    _ticker.close();
    return super.close();
  }
}
