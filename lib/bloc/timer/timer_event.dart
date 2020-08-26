/// The Events that can be used to transform the [TimerBloc] [TimerState].
enum TimerEvent {
  /// This event starts the timer.
  start,

  /// This event should be purely used by the [Timer] that is registered inside
  /// of [TimerBloc] and should **not** be invoked manually
  timerTicked,

  /// This event should be used to Pause the current timer
  pause,

  /// This event should be used to Resume the current timer.
  ///
  /// It does only work if the [TimerBloc] was previously paused.
  resume,

  /// This event should be used to Replay the [Exercise].
  ///
  /// It does only work if the [TimerBloc] has previously finished.
  replay
}
