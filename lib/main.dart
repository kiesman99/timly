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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
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
