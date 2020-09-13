import 'package:tyme/model/exercise.dart';
import 'package:tyme/repository/exercise_repository.dart';

class ExerciseMockRepository implements ExerciseRepository {
  List<Exercise> _exercises = [
    Exercise(
        name: 'Test',
        interval: const Duration(seconds: 10),
        recover: const Duration(seconds: 12),
        laps: 3)
  ];

  @override
  Future delete(Exercise exercise) {
    _exercises.remove(exercise);
  }

  @override
  Future insert(Exercise exercise) {
    _exercises.add(exercise);
  }

  @override
  Future update(Exercise exercise) {}

  @override
  Future<List<Exercise>> getAll() {
    return Future.value(_exercises);
  }
}
