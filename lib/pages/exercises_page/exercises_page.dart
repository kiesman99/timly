import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_state.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:tyme/model/exercise.dart';

import 'exercises_list.dart';

class ExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersistenceBloc, PersistenceState>(
      builder: (_, PersistenceState state) {
        return state.when(error: () {
          return Scaffold(
              body: Center(child: Text(t.bloc_persistence.error_loading)));
        }, init: () {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }, loaded: (List<Exercise> exercises) {
          return ExercisesList(exercises);
        });
      },
    );
  }
}
