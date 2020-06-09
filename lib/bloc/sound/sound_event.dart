import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_event.freezed.dart';

@freezed
abstract class SoundEvent with _$SoundEvent {
  const factory SoundEvent.shortBeep() = LongBeep;

  const factory SoundEvent.longBeep() = ShortBeep;
}
