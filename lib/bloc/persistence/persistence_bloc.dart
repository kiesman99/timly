import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/bloc/persistence/persistence_state.dart';
import 'package:tyme/repository/exercise_hive_repository.dart';
import 'package:tyme/repository/exercise_repository.dart';
import 'package:tyme/utils/logger.dart';

class PersistenceBloc extends Bloc<PersistenceEvent, PersistenceState> with LoggerMixin {
  ExerciseRepository repository = ExerciseHiveRepository();

  PersistenceBloc() : super(PersistenceState.init());

  @override
  Stream<PersistenceState> mapEventToState(PersistenceEvent event) async* {
    _logging(event);

    yield* event.when(
        loadAll: () => _mapLoadAllEventToState(event),
        load: (_) => _mapLoadEventToState(event),
        add: (_) => _mapAddEventToState(event),
        delete: (_) => _mapDeleteEventToState(event),
        update: (_) => _mapUpdateEventToState(event),
        deleteAll: (_) => _mapDeleteAllEventToState(event));
  }

  Stream<PersistenceState> _mapDeleteAllEventToState(DeleteAll event) async* {
    for (var e in event.exercises) {
      await repository.delete(e);
    }
    this.add(PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapLoadAllEventToState(LoadAll event) async* {
    var exercises = await repository.getAll();
    yield PersistenceState.loaded(exercises);
  }

  Stream<PersistenceState> _mapLoadEventToState(Load event) async* {}

  Stream<PersistenceState> _mapAddEventToState(Add event) async* {
    await repository.insert(event.exercise);
    this.add(PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapDeleteEventToState(Delete event) async* {
    await repository.delete(event.exercise);
    this.add(PersistenceEvent.loadAll());
  }

  Stream<PersistenceState> _mapUpdateEventToState(Update event) async* {
    await repository.update(event.exercise);
    this.add(PersistenceEvent.loadAll());
  }

  void _logging(PersistenceEvent event) {
    event.when(
        loadAll: () => loggerNS.i("Loading all Exercises."),
        load: (exercise) => loggerNS.i("Loading $exercise"),
        add: (exercise) => loggerNS.i("Storing $exercise into DB"),
        delete: (exercise) =>  loggerNS.i("Deleting $exercise"),
        deleteAll: (exercises) => loggerNS.i("Deleting Exercises: $exercises"),
        update: (exercise) => loggerNS.i("Upading $exercise.")
    );
  }
}
