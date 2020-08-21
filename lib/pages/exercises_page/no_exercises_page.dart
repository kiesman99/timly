import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';

@immutable
class NoExercisesPage extends StatelessWidget {
  const NoExercisesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(t.exercises_page.no_exercises),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push<void>(MaterialPageRoute<void>(
              builder: (_) => BlocProvider<PersistenceBloc>.value(
                    value: context.bloc<PersistenceBloc>(),
                    child: ExerciseAddPage(),
                  )));
        },
      ),
    );
  }
}
