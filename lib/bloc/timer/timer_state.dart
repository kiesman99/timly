import 'package:equatable/equatable.dart';
import '../../model/exercise.dart';

/// {@temaplate timer_state}
/// This class is the base class for all
/// States that are used in [TimerBloc]
/// {@endtemplate}
abstract class TimerState extends Equatable {
  /// {@macro timer_state}
  const TimerState(this.laps, this.remaining);

  /// The remaining laps
  final int laps;

  /// The remaining duration of the current state
  final Duration remaining;

  @override
  List<Object> get props => [laps, remaining];

  @override
  String toString() {
    return '$runtimeType: {laps: $laps, '
        'durationInSeconds: ${remaining.inSeconds}}';
  }
}

/// {@template initial}
/// This state is the initial State of the [TimerBloc]. It holds the laps that
/// should be completet, but **no actual reamining time** as the inital state
/// does not have to elapse a given time.
/// {@endtemplate}
class Initial extends TimerState {
  /// {@macro initial}
  Initial(final Exercise exericse) : super(exericse.laps, Duration.zero);
}

/// {@tempalte running}
/// The state that is used if the [TimerBloc] decrements the intervall duration.
/// {@endtemplate}
class Workout extends TimerState {
  /// {@macro running}
  const Workout(int laps, Duration remaining) : super(laps, remaining);
}

/// {@tempalte recover}
/// The state that is used if the [TimerBloc] decrements the recover duration.
/// {@endtemplate}
class Recover extends TimerState {
  /// {@marco recover}
  const Recover(int laps, Duration remaining) : super(laps, remaining);
}

/// {@tempalte setup}
/// The state that is used if the [TimerBloc] decrements the setup duration.
/// {@endtemplate}
class Setup extends TimerState {
  /// {@marco setup}
  const Setup(int laps, Duration remaining) : super(laps, remaining);
}

/// {@tempalte pause}
/// The state that is used if the [TimerBloc] currently is paused.
/// {@endtemplate}
class Paused extends TimerState {
  /// {@marco pause}
  Paused(this.lastState) : super(lastState.laps, lastState.remaining);

  /// The last [TimerState] that was active before [TimerBloc] was paused.
  final TimerState lastState;
}

/// {@template finished}
/// The state that is used if the [Exercise] if completely done.
/// {@endtemplate}
class Finished extends TimerState {
  /// {@macro finished}
  const Finished() : super(0, Duration.zero);
}
