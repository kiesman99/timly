import 'package:tyme/model/exercise.dart';
import 'package:tyme/repository/exercise_repository.dart';

class ExerciseMockRepository implements ExerciseRepository {
  final List<Exercise> _exercises = [
    Exercise(
        name: 'Test',
        interval: const Duration(seconds: 10),
        recover: const Duration(seconds: 12),
        laps: 3)
  ];

  @override
  Future delete(Exercise exercise) {
    _exercises.remove(exercise);
    return null;
  }

  @override
  Future insert(Exercise exercise) {
    _exercises.add(exercise);
    return null;
  }

  @override
  Future update(Exercise exercise) {
    return null;
  }

  @override
  Future<List<Exercise>> getAll() {
    return Future.value(_exercises);
  }
}
