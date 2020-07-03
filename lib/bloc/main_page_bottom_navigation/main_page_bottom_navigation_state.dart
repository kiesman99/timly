import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_bottom_navigation_state.freezed.dart';

@freezed
abstract class MainPageBottomNavigationState
    with _$MainPageBottomNavigationState {
  const factory MainPageBottomNavigationState.exercises(
      {@Default(0) int index}) = ExercisesPageState;

  const factory MainPageBottomNavigationState.quickTimer(
      {@Default(1) int index}) = QuickTimerPageState;

  const factory MainPageBottomNavigationState.settings(
      {@Default(2) int index}) = SettingsPageState;
}
