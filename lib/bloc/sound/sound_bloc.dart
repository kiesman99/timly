import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:tyme/bloc/sound/sound_event.dart';
import 'package:tyme/bloc/sound/sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  Soundpool _soundpool;

  /// The id of the short beep sound file
  Future<int> _shortBeepId;

  /// The id of the long beep sound file
  Future<int> _longBeepId;

  SoundBloc() : super(SoundState.idle()) {
    if (_soundpool == null) {
      _soundpool = Soundpool();
    }

    // load sound id's
    _shortBeepId = _loadShortBeep();
    _longBeepId = _loadLongBeep();
  }

  @override
  Stream<SoundState> mapEventToState(SoundEvent event) async* {
    if (event is LongBeep) {
      yield* _mapLongBeepEventToState(event);
    } else if (event is ShortBeep) {
      yield* _mapShortBeepEventToState(event);
    }
  }

  /// This function will load the short beep asset file
  /// and return it's soundpool id
  Future<int> _loadShortBeep() async {
    var asset = await rootBundle.load("assets/sounds/beep_short.mp3");
    return _soundpool.load(asset);
  }

  /// This function will load the short beep asset file
  /// and return it's soundpool id
  Future<int> _loadLongBeep() async {
    var asset = await rootBundle.load("assets/sounds/beep_long.mp3");
    return _soundpool.load(asset);
  }

  /// This function will play the long beep sound
  Future<int> _playLongBeep() async {
    var longBeep = await _longBeepId;
    return await _soundpool.play(longBeep);
  }

  /// This function will play the short beep sound
  Future<int> _playShortBeep() async {
    var shortBeep = await _shortBeepId;
    return await _soundpool.play(shortBeep);
  }

  Stream<SoundState> _mapLongBeepEventToState(LongBeep event) async* {
    var streamId = await _playLongBeep();
    yield SoundState.playing(streamId);
    yield SoundState.idle();
  }

  Stream<SoundState> _mapShortBeepEventToState(ShortBeep event) async* {
    var streamId = await _playShortBeep();
    yield SoundState.playing(streamId);
    yield SoundState.idle();
  }
}
