import 'package:flutter/material.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:tyme/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';
import 'package:tyme/pages/exercises_page/no_exercises_page.dart';

import 'exercise_list_tile.dart';

class ExercisesList extends StatefulWidget {
  const ExercisesList(this.exercises);

  final List<Exercise> exercises;

  @override
  _ExercisesListState createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  List<Exercise> get _exercises => widget.exercises;

  @override
  Widget build(BuildContext pageContext) {
    if (_exercises.isEmpty) {
      return const NoExercisesPage();
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.exercises_page.title)),
      body: ListView.builder(
        itemCount: _exercises.length,
        itemBuilder: (_, int index) {
          return ExerciseTile(exercise: _exercises.elementAt(index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(ExerciseAddPage.route(
              persistenceBloc: context.bloc<PersistenceBloc>()));
        },
      ),
    );
  }
}
