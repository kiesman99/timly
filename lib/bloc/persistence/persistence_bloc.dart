import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/bloc/persistence/persistence_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/repository/exercise_hive_repository.dart';
import 'package:tyme/repository/exercise_repository.dart';
import 'package:tyme/utils/logger.dart';

class PersistenceBloc extends Bloc<PersistenceEvent, PersistenceState>
    with LoggerMixin {
  PersistenceBloc() : super(const PersistenceState.init());
  ExerciseRepository repository = ExerciseHiveRepository();

  @override
  Stream<PersistenceState> mapEventToState(PersistenceEvent event) async* {
    _logging(event);

    yield* event.when(
        loadAll: () => _mapLoadAllEventToState(event as LoadAll),
        load: (_) => _mapLoadEventToState(event as Load),
        add: (_) => _mapAddEventToState(event as Add),
        delete: (_) => _mapDeleteEventToState(event as Delete),
        update: (_) => _mapUpdateEventToState(event as Update),
        deleteAll: (_) => _mapDeleteAllEventToState(event as DeleteAll));
  }

  Stream<PersistenceState> _mapDeleteAllEventToState(DeleteAll event) async* {
    for (final Exercise e in event.exercises) {
      await repository.delete(e);
    }
    add(const PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapLoadAllEventToState(LoadAll event) async* {
    final List<Exercise> exercises = await repository.getAll();
    print('Loaded Exercises: $exercises');
    yield PersistenceState.loaded(exercises);
  }

  Stream<PersistenceState> _mapLoadEventToState(Load event) async* {}

  Stream<PersistenceState> _mapAddEventToState(Add event) async* {
    await repository.insert(event.exercise);
    add(const PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapDeleteEventToState(Delete event) async* {
    await repository.delete(event.exercise);
    add(const PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapUpdateEventToState(Update event) async* {
    await repository.update(event.exercise);
    add(const PersistenceEvent.loadAll());
  }

  void _logging(PersistenceEvent event) {
    event.when(
        loadAll: () => loggerNS.i('Loading all Exercises.'),
        load: (Exercise exercise) => loggerNS.i('Loading $exercise'),
        add: (Exercise exercise) => loggerNS.i('Storing $exercise into DB'),
        delete: (Exercise exercise) => loggerNS.i('Deleting $exercise'),
        deleteAll: (List<Exercise> exercises) =>
            loggerNS.i('Deleting Exercises: $exercises'),
        update: (Exercise exercise) => loggerNS.i('Upading $exercise.'));
  }
}
