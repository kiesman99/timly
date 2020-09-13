import 'package:tyme/bloc/blocs.dart';

import 'interval_ticker.dart';
import 'timer_event.dart';

/// {@temaplte timer_bloc_timer}
/// This timer dispatches a [TimerEvent.timerTicked] each second if active.
/// {@endtemplate}
class OneSecondIntervalTicker extends IntervalTicker {
  /// {@macro timer_bloc_timer}
  OneSecondIntervalTicker() : super(const Duration(seconds: 1));
}
