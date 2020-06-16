import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'burn_in_state.freezed.dart';

@freezed
abstract class BurnInState with _$BurnInState {
  const factory BurnInState.protecting(double leftPadding, double topPadding) =
      Protecting;

  const factory BurnInState.unconcerning() = Unconcerning;
}
