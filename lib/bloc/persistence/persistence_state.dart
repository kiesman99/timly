import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tyme/model/exercise.dart';

part 'persistence_state.freezed.dart';

@freezed
abstract class PersistenceState with _$PersistenceState {
  const factory PersistenceState.error() = Error;

  const factory PersistenceState.init() = Init;

  const factory PersistenceState.loaded(List<Exercise> exercises) = Loaded;
}
