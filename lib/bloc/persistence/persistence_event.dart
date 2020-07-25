import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tyme/model/exercise.dart';

part 'persistence_event.freezed.dart';

@freezed
abstract class PersistenceEvent with _$PersistenceEvent {
  const factory PersistenceEvent.loadAll() = LoadAll;

  const factory PersistenceEvent.load(Exercise exercise) = Load;

  const factory PersistenceEvent.add(Exercise exercise) = Add;

  const factory PersistenceEvent.delete(Exercise exercise) = Delete;

  const factory PersistenceEvent.deleteAll(List<Exercise> exercises) =
      DeleteAll;

  const factory PersistenceEvent.update(Exercise exercise) = Update;
}
