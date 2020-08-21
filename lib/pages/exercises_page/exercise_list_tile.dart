import 'package:flutter/material.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';

@immutable
class ExerciseTile extends StatelessWidget {
  const ExerciseTile({this.exercise, this.onTap});

  final Exercise exercise;
  final VoidCallback onTap;

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
          onTap: onTap,
          onLongPress: () => _longPress(context),
          title: Text(exercise.name),
          leading: CircleAvatar(
            child: Text('${exercise.laps}x'),
            backgroundColor: Colors.teal[800],
          ),
        ));
  }

  void _longPress(BuildContext context) {
    print('Long press');
    Navigator.of(context).push<void>(MaterialPageRoute<void>(
        builder: (_) => BlocProvider<PersistenceBloc>.value(
              value: context.bloc<PersistenceBloc>(),
              child: ExerciseEditPage(exerciseToUpdate: exercise),
            )));
  }
}

@immutable
class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();
  @override
  Widget build(BuildContext context) {
    return Container(
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
