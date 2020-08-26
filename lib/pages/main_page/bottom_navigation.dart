import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:tyme/pages/main_page/bottom_navigation_cubit.dart';

@immutable
class BottomNavigation extends StatelessWidget {
  const BottomNavigation();
  @override
  Widget build(BuildContext context) {
    final BottomNavigationCubit _navigationCubit =
        context.bloc<BottomNavigationCubit>();

    return BlocBuilder<BottomNavigationCubit, BottomNavPages>(
      builder: (_, BottomNavPages page) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.teal[300],
          onTap: _navigationCubit.navigate,
          currentIndex: page.index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(t.main_page.bottom_navigation_exercises),
              icon: const Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              title: Text(t.main_page.bottom_navigation_quick_timer),
              icon: const Icon(Icons.av_timer),
            ),
            BottomNavigationBarItem(
                title: Text(t.main_page.bottom_navigation_settings),
                icon: const Icon(Icons.settings))
          ],
        );
      },
    );
  }
}
