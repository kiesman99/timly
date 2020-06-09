import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_state.freezed.dart';

@freezed
abstract class SoundState with _$SoundState {
  const factory SoundState.idle() = IDLE;

  const factory SoundState.playing(int streamId) = Playing;
}
