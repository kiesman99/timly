import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/blocs.dart';
import 'package:tyme/pages/exercises/exercises_page.dart';
import 'package:tyme/pages/main_page/bottom_navigation_cubit.dart';
import 'package:tyme/pages/quick_timer/quick_timer_page.dart';
import 'package:tyme/pages/settings/settings_page.dart';

import 'bottom_navigation.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (_) => BottomNavigationCubit(),
        ),
        BlocProvider<PersistenceBloc>(
            create: (_) =>
                PersistenceBloc()..add(const PersistenceEvent.loadAll()))
      ],
      child: Scaffold(
        body: _ActualMainPage(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class _ActualMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavPages>(
      builder: (_, BottomNavPages page) {
        switch (page) {
          case BottomNavPages.EXERCISES:
            return ExercisesPage();
            break;
          case BottomNavPages.QUICK_TIMER:
            return QuickTimerPage();
            break;
          case BottomNavPages.SETTINGS:
            return SettingsPage();
            break;
          default:
            return ExercisesPage();
            break;
        }
      },
    );
  }
}
