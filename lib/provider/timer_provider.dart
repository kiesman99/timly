import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {

  Duration displayDuration;

  Duration _timerDuration, _pauseDuration, _setupDuration, _recoverDuration;
  int _laps;
  Timer _timer;
  _TimerState _state = _TimerState.SETUP;

  int get laps => _laps;

  TimerProvider(
      this._timerDuration,
      this._recoverDuration,
      this._setupDuration,
      this._laps
      ) {
    assert(_timerDuration != null);
    assert(_recoverDuration != null);
    assert(_setupDuration != null);
    assert(_laps != null);
    assert(_laps != 0);

    print(
"""
New TimerProvider(
  timer: $_timerDuration,
  recover: $_recoverDuration,
  setup: $_setupDuration,
  laps: $_laps
);
""");

    displayDuration = _setupDuration;
    print("Provider CREATED");
    if (_timer == null) {
      print("TIMER WAS NULL");
      // here the Timer is invoking the tick function each second
      _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) => _timerTick());
    }
  }

  void _timerTick() {
    print("TICK, STATE: $_state, DURATION: ${displayDuration.inSeconds}");
    switch(_state) {
      case _TimerState.RUNNING:
        _runningTick();
        break;
      case _TimerState.PAUSED:
        // nothing happens. It's paused.
        break;
      case _TimerState.SETUP:
        setupTick();
        break;
      case _TimerState.FINISHED:
        // nothing happens, it's finished.
      print("FINISHED");
        break;
      case _TimerState.RECOVER:
        recoverTick();
        break;
    }
    notifyListeners();
  }

  void pause() {
    _state = _TimerState.PAUSED;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    print("Provider DESTROYED");
    super.dispose();
  }

  void setupTick() {
    if (displayDuration.inSeconds == 0) {
      displayDuration = _timerDuration;
      _state = _TimerState.RUNNING;
    } else {
      displayDuration -= const Duration(seconds: 1);
    }
  }

  void _runningTick() {
    if (_laps == 0) {
      _state = _TimerState.FINISHED;
      return;
    }

    if (displayDuration.inSeconds == 0) {
      displayDuration = _recoverDuration;
      _state = _TimerState.RECOVER;
    } else {
      displayDuration -= const Duration(seconds: 1);
    }
  }

  void recoverTick() {
    if (displayDuration.inSeconds == 0) {
      displayDuration = _timerDuration;
      _laps -= 1;
      _state = _TimerState.RUNNING;
    } else {
      displayDuration -= const Duration(seconds: 1);
    }
  }

}


enum _TimerState {
  RUNNING,
  RECOVER,
  PAUSED,
  SETUP,
  FINISHED
}