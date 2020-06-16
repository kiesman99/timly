import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'burn_in_event.freezed.dart';

@freezed
abstract class BurnInEvent with _$BurnInEvent {
  const factory BurnInEvent.touched() = Touched;

  const factory BurnInEvent.protect() = Protect;
}
