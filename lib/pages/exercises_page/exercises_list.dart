import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:tyme/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';
import 'package:tyme/pages/exercises_page/no_exercises_page.dart';
import 'package:tyme/service/tts_service.dart';

import '../timer_page.dart';
import 'exercise_list_tile.dart';

class ExercisesList extends StatefulWidget {
  const ExercisesList(this.exercises);

  final List<Exercise> exercises;

  @override
  _ExercisesListState createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  PersistenceBloc get persistenceBloc => context.bloc<PersistenceBloc>();

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
          final Exercise exercise = widget.exercises.elementAt(index);
          return ExerciseTile(
            exercise: exercise,
            onTap: () {
              Navigator.of(context).push<void>(MaterialPageRoute<void>(
                  builder: (_) => Provider<Exercise>.value(
                        value: exercise,
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider<TimerBloc>(
                              create: (_) => TimerBloc(exercise, TTSService()),
                            ),
                            BlocProvider<BurnInBloc>(
                              create: (_) => BurnInBloc(),
                            )
                          ],
                          child: TimerPage(
                              //exercise: e,
                              ),
                        ),
                      )));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push<void>(MaterialPageRoute<void>(
              builder: (_) => BlocProvider<PersistenceBloc>.value(
                    value: persistenceBloc,
                    child: ExerciseAddPage(),
                  )));
        },
      ),
    );
  }
}
