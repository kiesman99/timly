import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timly/bloc/main_page_bottom_navigation/main_page_bottom_navigation_bloc.dart';
import 'package:timly/bloc/main_page_bottom_navigation/main_page_bottom_navigation_event.dart';
import 'package:timly/bloc/main_page_bottom_navigation/main_page_bottom_navigation_state.dart';
import 'package:timly/pages/exercises_page.dart';
import 'package:timly/pages/quick_timer_page.dart';
import 'package:timly/pages/settings_page.dart';
import 'package:timly/widgets/bottom_navigation_transition.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MainPageBottomNavigationBloc,
        MainPageBottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationTransition(
          child: state.when(
              exercises: (_) => ExercisesPage(),
              quickTimer: (_) => QuickTimerPage(),
              settings: (_) => SettingsPage()),
        );
      },
    ), bottomNavigationBar: BlocBuilder<MainPageBottomNavigationBloc,
        MainPageBottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.teal[300],
          onTap: (index) => context
              .bloc<MainPageBottomNavigationBloc>()
              .add(MainPageBottomNavigationEvent.navigate(index)),
          currentIndex: state.index,
          items: [
            BottomNavigationBarItem(
              title: Text('main_page.bottom_navigation_exercises').tr(),
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              title: Text('main_page.bottom_navigation_quick_timer').tr(),
              icon: Icon(Icons.av_timer),
            ),
            BottomNavigationBarItem(
                title: Text('main_page.bottom_navigation_settings').tr(),
                icon: Icon(Icons.settings))
          ],
        );
      },
    ));
  }
}
