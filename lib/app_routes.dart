import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';
import 'package:tyme/pages/main_page/main_page.dart';

PersistenceBloc _persistenceBloc = PersistenceBloc();

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) {
    return BlocProvider<PersistenceBloc>.value(
      value: _persistenceBloc..add(const PersistenceEvent.loadAll()),
      child: MainPage(),
    );
  },
  '/exercise/update': (_) {
    return BlocProvider<PersistenceBloc>.value(
      value: _persistenceBloc,
      child: const ExerciseEditPage(),
    );
  }
};
