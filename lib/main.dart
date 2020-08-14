import 'package:fast_i18n/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/main_page.dart';
import 'package:tyme/type_adapter/duration_type_adapter.dart';

import './globals.dart';
import 'i18n/strings.g.dart';

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

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    LocaleSettings.useDeviceLocale().whenComplete(() {
      setState((){});
    });
  }

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
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal[800], width: 3.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal[400], width: 3.0)),
              hintStyle: TextStyle(
                color: Colors.teal[300],
                fontSize: 40.0,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 100.0, color: Colors.white),
              headline2: TextStyle(color: Colors.white),
              headline3: TextStyle(fontSize: 60.0, color: Colors.white),
              headline4: TextStyle(color: Colors.white),
              headline5: TextStyle(color: Colors.white),
              headline6: TextStyle(fontSize: 20.0, color: Colors.white),
              subtitle1: TextStyle(fontSize: 20.0, color: Colors.white),
              // ListTile title
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
              overline: TextStyle(color: Colors.white),
            )),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PersistenceBloc(),
            ),
            BlocProvider(
              create: (context) => MainPageBottomNavigationBloc(),
            )
          ],
          child: MainPage(),
        ));
  }
}
