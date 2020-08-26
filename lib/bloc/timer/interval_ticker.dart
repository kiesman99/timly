import 'dart:async';
import 'package:meta/meta.dart';

/// {@template custom_timer}
/// This timer should be used as a timer for
/// this application. It uses [Timer]
/// {@endtemplate}
abstract class IntervalTicker {
  /// {@marco custom_timer}
  IntervalTicker(this._timerDuration);

  /// The interval in which the timer is invoked
  final Duration _timerDuration;
  final StreamController<Tick> _tickStreamController = StreamController<Tick>();
  Timer _timer;

  /// The [Stream] that exposes the [Tick] events to the class
  /// that needs to subscribe to this event.
  Stream<Tick> get tickStream => _tickStreamController.stream;

  void start() {
    _timer = Timer.periodic(
        _timerDuration, (_) => _tickStreamController.add(const Tick()));
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void close() {
    _timer?.cancel();
    _timer = null;
  }
}

/// {@template tick}
/// A [Tick] is yielded by [CustomTicker] in a given interval.
/// {@endtemplate}
@immutable
class Tick {
  /// {@macro tick}
  const Tick();
}
