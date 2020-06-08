import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:timly/model/timly_state.dart';
import 'package:timly/model/timly_model.dart';
import 'package:timly/provider/sound_provider.dart';

class TimerProvider extends ChangeNotifier {

  Timer _timer;

  final SoundProvider _soundProvider;

  TimlyModel _state;
  TimlyModel get state => _state;

  // easier access getter
  Duration get _timerDuration => state.intervalDuration;
  Duration get _setupDuration => state.setupDuration;
  Duration get _recoverDuration => state.recoverDuration;
  Duration get displayDuration => _state.duration;

  int  get _laps => state.laps;

  int get laps => _laps;

  TimerProvider(
      this._state,
      this._soundProvider
      ) {
    _state = _state.copyWith(duration: _setupDuration);
    print("Provider CREATED");
    if (_timer == null) {
      print("TIMER WAS NULL");
      // here the Timer is invoking the tick function each second
      _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) => _timerTick());
    }
  }

  void _timerTick() {
    print("TICK, STATE: $_state, DURATION: ${displayDuration.inSeconds}");
    switch(state.state) {
      case TimlyState.RUNNING:
        _runningTick();
        break;
      case TimlyState.PAUSED:
        // nothing happens. It's paused.
        break;
      case TimlyState.SETUP:
        setupTick();
        break;
      case TimlyState.FINISHED:
        // nothing happens, it's finished.
      print("FINISHED");
        break;
      case TimlyState.RECOVER:
        recoverTick();
        break;
    }
    notifyListeners();
  }

  void pause() {
    _state = _state.copyWith(state: TimlyState.PAUSED);
    _timer.cancel();
    notifyListeners();
  }

  void resume() {
    _state = _state.copyWith(state: TimlyState.RUNNING);
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) => _timerTick());
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

    if ([1,2].contains(_state.duration.inSeconds)) {
      _soundProvider.playLongBeep();
    }

    if (displayDuration.inSeconds == 1) {
      _state = _state.copyWith(state: TimlyState.RUNNING, duration: _timerDuration);
    } else {
      _state.decrement();
    }
  }

  void _runningTick() {
    if (_laps == 0) {
      _state = _state.copyWith(state: TimlyState.FINISHED);
      return;
    }

    if (displayDuration.inSeconds == 1) {
      _soundProvider.playLongBeep();
      _state = _state.copyWith(state: TimlyState.RECOVER, duration: _recoverDuration);
    } else {
      _state.decrement();
    }
  }

  void recoverTick() {
    if (displayDuration.inSeconds == 1) {
      _state = _state.copyWith(state: TimlyState.RUNNING, laps: (_state.laps - 1), duration: _timerDuration);
    } else {
      if ([2,3].contains(_state.duration.inSeconds)) {
        _soundProvider.playShortBeep();
      } else if(_state.duration.inSeconds == 1) {
        _soundProvider.playLongBeep();
      }

      _state.decrement();
    }
  }

}
