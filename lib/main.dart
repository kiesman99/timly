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
            primarySwatch: Colors.teal,
            backgroundColor: Colors.teal[700],
            scaffoldBackgroundColor: Colors.teal[700],
            appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.teal[700]),
            primaryTextTheme:
                TextTheme(bodyText1: TextStyle(color: Colors.white)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 120.0, color: Colors.white),
              headline2: TextStyle(color: Colors.white),
              headline3: TextStyle(fontSize: 60.0, color: Colors.white),
              headline4: TextStyle(color: Colors.white),
              headline5: TextStyle(color: Colors.white),
              headline6: TextStyle(fontSize: 20.0, color: Colors.white),
              subtitle1: TextStyle(fontSize: 25.0, color: Colors.white),
              // ListTile title
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
              overline: TextStyle(color: Colors.white),
            )),
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
