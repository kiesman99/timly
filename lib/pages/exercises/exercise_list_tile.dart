import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/blocs.dart';
import '../../model/exercise.dart';
import '../exercise_add_edit/exercise_forms.dart';

import '../timer/timer_page.dart';

/// {@template exercise_tile}
/// This element is used to display all necessary information about the given
/// [Exercise].
/// {@endtemplate}
@immutable
class ExerciseTile extends StatelessWidget {
  /// {@macro exercise_tile}
  const ExerciseTile({@required Exercise exercise})
      : assert(exercise != null),
        _exercise = exercise;

  final Exercise _exercise;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: const _DeleteBackground(),
        onDismissed: (_) {
          context
              .bloc<PersistenceBloc>()
              .add(PersistenceEvent.delete(_exercise));

          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('${_exercise.name} deleted')));
        },
        child: ListTile(
          onTap: () => _onTap(context),
          onLongPress: () => _longPress(context),
          title: Text(_exercise.name),
          leading: CircleAvatar(
            child: Text('${_exercise.laps}x'),
            backgroundColor: Colors.teal[800],
          ),
        ));
  }

  void _onTap(BuildContext context) {
    Navigator.of(context).push(TimerPage.route(exercise: _exercise));
  }

  void _longPress(BuildContext context) {
    Navigator.of(context).push<void>(ExerciseEditPage.route<void>(
        exerciseToUpdate: _exercise,
        persistenceBloc: context.bloc<PersistenceBloc>()));
  }
}

@immutable
class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[Icon(Icons.delete), Icon(Icons.delete)],
      ),
    );
  }
}
