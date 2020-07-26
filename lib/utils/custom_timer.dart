
import 'dart:async';

/// This timer should be used as a timer for
/// this application. It uses [Timer]
abstract class CustomTimer {

  /// The interval in which the timer is invoked
  Duration interval;
  /// The callback that is invoked each [interval] tick
  Function callback;
  /// The timer used to invoke Ticks
  Timer timer;

  CustomTimer(this.interval);

  /// This function will start the timer
  void start();

  /// This function will stop the timer
  void stop();

}