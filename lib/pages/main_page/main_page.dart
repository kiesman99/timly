import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercises_page/exercises_page.dart';
import 'package:tyme/pages/main_page/bottom_navigation_cubit.dart';
import 'package:tyme/pages/quick_timer_page.dart';
import 'package:tyme/pages/settings_page.dart';

import 'bottom_navigation.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersistenceBloc>(
          create: (_) =>
              PersistenceBloc()..add(const PersistenceEvent.loadAll()),
        ),
        BlocProvider<BottomNavigationCubit>(
          create: (_) => BottomNavigationCubit(),
        )
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
