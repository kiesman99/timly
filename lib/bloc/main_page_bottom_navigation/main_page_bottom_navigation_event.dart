import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_bottom_navigation_event.freezed.dart';

@freezed
abstract class MainPageBottomNavigationEvent
    with _$MainPageBottomNavigationEvent {
  const factory MainPageBottomNavigationEvent.navigate(int index) = Navigate;
}
