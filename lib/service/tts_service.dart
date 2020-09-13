import 'dart:ui';

import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tyme/bloc/timer/timer_state.dart';

/// This Service is used to 'speak'
/// a certain sentence.
class TTSService {
  FlutterTts _tts = FlutterTts();

  TTSService() {
    _init();
  }

  Future _init() async {
    //print(await _tts.getLanguages);
    //await _setupLocale();
    await _tts.setSpeechRate(1.0);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  Future speak(String value) async {
    await _tts.speak(value);
  }

  Future speakNumber(int number) async {
    await _tts.speak(number.toString());
  }

  Future speakFromState(TimerState state) async {
    // TODO: implement function
  }

  void _mapRunningState(Duration duration) {
    if (duration.inSeconds.remainder(10) == 0) {
      speakNumber(duration.inSeconds);
      return;
    }

    if (duration.inSeconds <= 5) {
      speakNumber(duration.inSeconds);
      return;
    }
  }

  void _mapRecoverState(Duration duration) {
    if (duration.inSeconds.remainder(10) == 0) {
      speakNumber(duration.inSeconds);
      return;
    }

    if (duration.inSeconds <= 5) {
      speakNumber(duration.inSeconds);
      return;
    }
  }

  void _mapSetupState(Duration duration) {
    if (duration.inSeconds <= 5) {
      speakNumber(duration.inSeconds);
      return;
    }
  }

  void _mapFinishState() {
    speak('Fertig');
  }

  void _mapPauseState() {
    speak('Pause');
  }
}
