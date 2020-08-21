import 'package:bloc/bloc.dart';

/// All pages that are accessible through
/// the [BottomNavigation]
enum BottomNavPages { EXERCISES, QUICK_TIMER, SETTINGS }

/// Is used to handle switching the page of the
/// [BottomNavigation]
class BottomNavigationCubit extends Cubit<BottomNavPages> {
  BottomNavigationCubit() : super(BottomNavPages.EXERCISES);

  void navigate(final int pageIndex) => emit(BottomNavPages.values[pageIndex]);
}
