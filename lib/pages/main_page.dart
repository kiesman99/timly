import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_bloc.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_event.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_state.dart';
import 'file:///C:/Users/jvietz/Workspace/Private/timly/lib/pages/exercises_page/exercises_page.dart';
import 'package:tyme/pages/quick_timer_page.dart';
import 'package:tyme/pages/settings_page.dart';
import 'package:tyme/widgets/bottom_navigation_transition.dart';

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
              title: Text(t.main_page.bottom_navigation_exercises),
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              title: Text(t.main_page.bottom_navigation_quick_timer),
              icon: Icon(Icons.av_timer),
            ),
            BottomNavigationBarItem(
                title: Text(t.main_page.bottom_navigation_settings),
                icon: Icon(Icons.settings))
          ],
        );
      },
    ));
  }
}
