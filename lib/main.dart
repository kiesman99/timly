import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tyme/app_routes.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_forms.dart';
import 'package:tyme/pages/main_page/main_page.dart';
import 'package:tyme/theme/app_theme.dart';
import 'package:tyme/type_adapter/duration_type_adapter.dart';

import './globals.dart';
import 'bloc/persistence/persistence_bloc.dart';
import 'bloc/persistence/persistence_event.dart';
import 'i18n/strings.g.dart';

void _registerHiveAdapter() {
  Hive.registerAdapter(DurationTypeAdapter());
  Hive.registerAdapter(ExerciseAdapter());
}

Future<void> _initialOpenHiveBoxes() async {
  final List<Future<dynamic>> boxOpenings = [
    Hive.openBox<Exercise>(exercise_box_name)
  ];
  await Future.wait<dynamic>(boxOpenings);
}

void main() async {
  _registerHiveAdapter();
  await Hive.initFlutter();
  await _initialOpenHiveBoxes();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocaleSettings.useDeviceLocale().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: AppTheme.appTheme, home: MainPage());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
