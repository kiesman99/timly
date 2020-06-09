import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timly_model.freezed.dart';

@freezed
abstract class TimlyModel with _$TimlyModel {
  const factory TimlyModel(
      {@required Duration intervalDuration,
      @required Duration recoverDuration,
      @required Duration setupDuration,
      @required int laps}) = _TimlyModel;
}