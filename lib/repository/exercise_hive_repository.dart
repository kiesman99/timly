import 'package:hive/hive.dart';
import 'package:tyme/globals.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/repository/exercise_repository.dart';

class ExerciseHiveRepository extends ExerciseRepository {
  static final ExerciseHiveRepository _instance = ExerciseHiveRepository._();

  ExerciseHiveRepository._();

  factory ExerciseHiveRepository() => _instance;

  Box<Exercise> _exerciseBox = Hive.box(exercise_box_name);

  @override
  Future<List<Exercise>> getAll() {
    return Future.value(_exerciseBox.values.toList());
  }

  @override
  Future<Exercise> delete(Exercise exercise) {
    _exerciseBox.delete(exercise.key);
    return Future.value(exercise);
  }

  @override
  Future<Exercise> insert(Exercise exercise) async {
    await _exerciseBox.add(exercise);
    return Future.value(exercise);
  }

  @override
  Future<Exercise> update(Exercise exercise) {
    print(exercise.key.runtimeType);
    _exerciseBox.put(exercise.key, exercise);
    return Future.value(exercise);
  }
}
