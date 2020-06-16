import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timly/bloc/persistence/persistence_bloc.dart';
import 'package:timly/bloc/sound/sound_bloc.dart';
import 'package:timly/model/exercise.dart';
import 'package:timly/pages/exercises_page.dart';
import 'package:timly/type_adapter/duration_type_adapter.dart';

import './globals.dart';

void _registerHiveAdapter() {
  Hive.registerAdapter(DurationTypeAdapter());
  Hive.registerAdapter(ExerciseAdapter());
}

Future<void> _initialOpenHiveBoxes() async {
  List<Future> boxOpenings = [Hive.openBox<Exercise>(exercise_box_name)];
  await Future.wait(boxOpenings);
}

void main() async {
  _registerHiveAdapter();
  await Hive.initFlutter();
  await _initialOpenHiveBoxes();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
                headline1: TextStyle(fontSize: 120.0),
                headline3: TextStyle(fontSize: 60.0),
                headline6: TextStyle(fontSize: 20.0),
                subtitle1: TextStyle(fontSize: 25.0))),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SoundBloc(),
            ),
            BlocProvider(
              create: (context) => PersistenceBloc(),
            )
          ],
          child: ExercisesPage(),
        ));
  }
}
