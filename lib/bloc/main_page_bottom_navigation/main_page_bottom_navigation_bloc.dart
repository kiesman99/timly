import 'package:bloc/bloc.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_event.dart';
import 'package:tyme/bloc/main_page_bottom_navigation/main_page_bottom_navigation_state.dart';

import 'main_page_bottom_navigation_state.dart';

class MainPageBottomNavigationBloc
    extends Bloc<MainPageBottomNavigationEvent, MainPageBottomNavigationState> {
  MainPageBottomNavigationBloc()
      : super(MainPageBottomNavigationState.exercises());

  @override
  Stream<MainPageBottomNavigationState> mapEventToState(
      MainPageBottomNavigationEvent event) async* {
    yield* _mapNavigationEventToState(event);
  }

  Stream<MainPageBottomNavigationState> _mapNavigationEventToState(
      Navigate event) async* {
    switch (event.index) {
      case 0:
        yield MainPageBottomNavigationState.exercises();
        break;
      case 1:
        yield MainPageBottomNavigationState.quickTimer();
        break;
      case 2:
        yield MainPageBottomNavigationState.settings();
        break;
      default:
        yield MainPageBottomNavigationState.exercises();
        break;
    }
  }
}
