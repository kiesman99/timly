import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/testing/async.dart';
import 'package:tyme/bloc/timer/interval_ticker.dart';

import 'package:dartx/dartx.dart';
import 'package:tyme/bloc/timer/one_second_interval_ticker.dart';

class TwentySecondIntervalTicker extends IntervalTicker {
  static const Duration duration = Duration(seconds: 20);
  TwentySecondIntervalTicker() : super(duration);
}

void main() {
  group('OneSecondIntervalTicker', () {
    FakeAsync fakeAsync;
    OneSecondIntervalTicker ticker;
    List<Tick> ticks;

    setUp(() {
      fakeAsync = FakeAsync();
      ticker = OneSecondIntervalTicker();
      ticks = [];
      fakeAsync.run((self) => ticker.start());
    });

    tearDown(() {
      fakeAsync.run((self) => ticker.stop());
    });

    test('gets 5 events in 5 seconds', () {
      fakeAsync.run((self) {
        ticker.tickStream.listen((event) {
          ticks.add(event);
        });
        self.elapse(5.seconds);
        expect(ticks,
            [isA<Tick>(), isA<Tick>(), isA<Tick>(), isA<Tick>(), isA<Tick>()]);
      });
    });

    test('does not push events if ticker is stopped', () {
      fakeAsync.run((self) {
        var tickSubscription = ticker.tickStream.listen((event) {
          ticks.add(event);
        });

        self.elapse(2.seconds);
        ticker.stop();
        self.elapse(3.seconds);
        expect(ticks, List.generate(2, (_) => isA<Tick>()).toList());
        tickSubscription.cancel();
      });
    });

    test('does resume pusing events if ticker is started after stopped', () {
      fakeAsync.run((self) {
        var tickSubscription = ticker.tickStream.listen((event) {
          ticks.add(event);
        });
        self.elapse(2.seconds);
        ticker.stop();
        self.elapse(3.seconds);
        ticker.start();
        self.elapse(2.seconds);
        expect(ticks, List.generate(4, (_) => isA<Tick>()).toList());
        tickSubscription.cancel();
      });
    });
  });

  group('TwentySecondIntervalTimer', () {
    TwentySecondIntervalTicker ticker;
    List<Tick> ticks;
    FakeAsync fakeAsync;

    setUp(() {
      fakeAsync = FakeAsync();
      ticker = TwentySecondIntervalTicker();
      fakeAsync.run((self) => ticker.start());
      ticker.start();
      ticks = [];
    });

    tearDown(() {
      fakeAsync.run((self) => ticker.stop());
    });

    test('gets 2 events in 40 seconds', () {
      fakeAsync.run((self) {
        ticker.tickStream.listen((event) {
          ticks.add(event);
        });
        self.elapse(40.seconds);
        expect(ticks, List.generate(2, (_) => isA<Tick>()).toList());
      });
    });

    test('gets no event in 5 seconds', () {
      FakeAsync().run((self) {
        ticker.tickStream.listen((event) {
          ticks.add(event);
        });
        self.elapse(5.seconds);
        expect(ticks, []);
      });
    });

    test('gets no event in 19 seconds', () {
      FakeAsync().run((self) {
        ticker.tickStream.listen((event) {
          ticks.add(event);
        });
        self.elapse(19.seconds);
        expect(ticks, []);
      });
    });
  });
}
