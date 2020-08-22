import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';
import 'package:tyme/service/tts_service.dart';

import '../timer_page.dart';

@immutable
class ExerciseTile extends StatelessWidget {
  const ExerciseTile({this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: const _DeleteBackground(),
        onDismissed: (_) {
          context
              .bloc<PersistenceBloc>()
              .add(PersistenceEvent.delete(exercise));

          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('${exercise.name} deleted')));
        },
        child: ListTile(
          onTap: () => _onTap(context),
          onLongPress: () => _longPress(context),
          title: Text(exercise.name),
          leading: CircleAvatar(
            child: Text('${exercise.laps}x'),
            backgroundColor: Colors.teal[800],
          ),
        ));
  }

  void _onTap(BuildContext context) {
    Navigator.of(context).push(TimerPage.route(exercise: exercise));
  }

  void _longPress(BuildContext context) {
    Navigator.of(context).push<void>(ExerciseEditPage.route<void>(
        exerciseToUpdate: exercise,
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
