import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_event.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_state.dart';

import 'main_page_bottom_navigation_state.dart';

class MainPageBottomNavigationBloc
    extends Bloc<MainPageBottomNavigationEvent, MainPageBottomNavigationState> {
  MainPageBottomNavigationBloc()
      : super(const MainPageBottomNavigationState.exercises());

  @override
  Stream<MainPageBottomNavigationState> mapEventToState(
      MainPageBottomNavigationEvent event) async* {
    yield* _mapNavigationEventToState(event as Navigate);
  }

  Stream<MainPageBottomNavigationState> _mapNavigationEventToState(
      Navigate event) async* {
    switch (event.index) {
      case 0:
        yield const MainPageBottomNavigationState.exercises();
        break;
      case 1:
        yield const MainPageBottomNavigationState.quickTimer();
        break;
      case 2:
        yield const MainPageBottomNavigationState.settings();
        break;
      default:
        yield const MainPageBottomNavigationState.exercises();
        break;
    }
  }
}
