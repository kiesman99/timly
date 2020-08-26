import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tyme/bloc/blocs.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/bloc/timer/interval_ticker.dart';
import 'package:dartx/dartx.dart';

const setupDuration = Duration(seconds: 5);

class _FakeTicker extends Fake implements IntervalTicker {
  bool _isActive = false;
  final StreamController<Tick> _fakeStreamController = StreamController<Tick>();

  @override
  Stream<Tick> get tickStream => _fakeStreamController.stream;

  void tick([int times = 1]) {
    if (_isActive) {
      for (var i = 0; i < times; i++) {
        _fakeStreamController.add(const Tick());
      }
    }
  }

  @override
  void start() => _isActive = true;

  @override
  void stop() => _isActive = false;

  @override
  void close() {}
}

void main() {
  group('TickerBloc', () {
    _FakeTicker ticker;
    TimerBloc timerBloc;
    var exercise = const Exercise(
        name: 'TestExercise',
        interval: Duration(seconds: 10),
        recover: Duration(seconds: 12),
        laps: 3);
    setUp(() {
      ticker = _FakeTicker();
      timerBloc = TimerBloc(exercise, ticker);
    });

    test('initial state is Initial', () {
      expect(timerBloc.state, equals(Initial(exercise)));
    });

    blocTest('Setup State decrements', build: () {
      ticker
        ..start()
        ..tick(3);
      return timerBloc;
    }, expect: [
      Setup(exercise.laps, setupDuration),
      Setup(exercise.laps, setupDuration - 1.seconds),
      Setup(exercise.laps, setupDuration - 2.seconds)
    ]);

    blocTest('switches to Interval state after setup duration has finished',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Setup(exercise.laps, 1.seconds));
          ticker
            ..start()
            ..tick();
        },
        expect: [
          Setup(exercise.laps, 1.seconds),
          Workout(exercise.laps, exercise.interval)
        ]);

    blocTest('interval decrements',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Workout(exercise.laps, exercise.interval));
          ticker
            ..start()
            ..tick();
        },
        expect: [
          Workout(exercise.laps, exercise.interval),
          Workout(exercise.laps, exercise.interval - 1.seconds)
        ]);

    blocTest('switches to Finish state when no more laps are available',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Workout(1, 1.seconds));
          ticker
            ..start()
            ..tick();
        },
        expect: [isA<Workout>(), isA<Finished>()]);

    blocTest('switches to recover state after interval has finished',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Workout(exercise.laps, 1.seconds));
          ticker
            ..start()
            ..tick();
        },
        expect: [
          Workout(exercise.laps, 1.seconds),
          Recover(exercise.laps, exercise.recover)
        ]);

    blocTest('recover decrements',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Recover(exercise.laps, exercise.recover));
          ticker
            ..start()
            ..tick();
        },
        expect: [
          Recover(exercise.laps, exercise.recover),
          Recover(exercise.laps, exercise.recover - 1.seconds)
        ]);

    blocTest('switches to interval with decremented laps',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Recover(exercise.laps, 1.seconds));
          ticker
            ..start()
            ..tick();
        },
        expect: [
          Recover(exercise.laps, 1.seconds),
          Workout(exercise.laps - 1, exercise.interval)
        ]);

    blocTest('timer stops when pause event is injected',
        build: () => timerBloc,
        act: (bloc) async {
          ticker
            ..start()
            ..tick();
          await Future.delayed(1.seconds);
          bloc.add(TimerEvent.pause);
          await Future.delayed(1.seconds);
          // should be igored
          ticker..tick(2);
        },
        expect: [isA<Setup>(), isA<Paused>()]);

    var lastState;
    blocTest('timer is resumed with last state when timerBloc is resumed',
        build: () => timerBloc,
        act: (bloc) async {
          ticker.start();
          lastState = Workout(7, Duration(seconds: 17));
          bloc.emit(lastState);
          bloc.add(TimerEvent.pause);
          await Future.delayed(1.seconds);
          ticker.tick();
          bloc.add(TimerEvent.resume);
        },
        expect: [
          isA<Workout>(),
          isA<Paused>(),
          isA<Workout>(),
        ]);

    blocTest('starts all over when replay event is dispatched',
        build: () => timerBloc,
        act: (bloc) {
          bloc.emit(Workout(9, exercise.interval));
          bloc.add(TimerEvent.replay);
        },
        expect: [isA<Workout>(), Setup(exercise.laps, setupDuration)]);
  });
}
