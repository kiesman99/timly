import 'package:tyme/model/exercise.dart';

abstract class ExerciseRepository {
  /// This function will return all stored [Exercise]
  Future<List<Exercise>> getAll();

  /// This function is used to insert a new [Exercise]
  Future insert(Exercise exercise);

  /// This function will delete the given [exercise]
  Future delete(Exercise exercise);

  /// This function will update the given [exercise]
  Future update(Exercise exercise);
}
