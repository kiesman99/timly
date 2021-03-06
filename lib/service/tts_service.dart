import 'package:flutter_tts/flutter_tts.dart';

/// This Service is used to 'speak'
/// a certain sentence.
class TTSService {
  final FlutterTts _tts = FlutterTts();

  TTSService() {
    _init();
  }

  Future _init() async {
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
}
