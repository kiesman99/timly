import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tyme/pages/timer/widgets/timer_progress/timer_progress.dart';

const goldensDir = 'goldens/';

void main() {
  testWidgets('progress 50%', (tester) async {
    var widget = TimerProgress(
      indicatorColor: Colors.amber,
      intervalProgress: 0.5,
      durationLeft: '30s',
    );
    await tester.pumpWidget(widget);
    await expectLater(find.byType(TimerProgress),
        matchesGoldenFile('${goldensDir}progress_50_percent.png'));
  });

  testWidgets('progress 0%', (tester) async {
    var widget = TimerProgress(
      indicatorColor: Colors.amber,
      intervalProgress: 0.0,
      durationLeft: '30s',
    );
    await tester.pumpWidget(widget);
    await expectLater(find.byType(TimerProgress),
        matchesGoldenFile('${goldensDir}progress_0_percent.png'));
  });

  testWidgets('progress 100%', (tester) async {
    var widget = TimerProgress(
      indicatorColor: Colors.amber,
      intervalProgress: 1.0,
      durationLeft: '30s',
    );
    await tester.pumpWidget(widget);
    await expectLater(find.byType(TimerProgress),
        matchesGoldenFile('${goldensDir}progress_100_percent.png'));
  });

  testWidgets('progress 99%', (tester) async {
    var widget = TimerProgress(
      indicatorColor: Colors.green,
      intervalProgress: 0.99,
      durationLeft: '30s',
    );
    await tester.pumpWidget(widget);
    await expectLater(find.byType(TimerProgress),
        matchesGoldenFile('${goldensDir}progress_99_percent.png'));
  });

  testWidgets('progress 75%', (tester) async {
    var widget = TimerProgress(
      indicatorColor: Colors.red,
      intervalProgress: 0.75,
      durationLeft: '30s',
    );
    await tester.pumpWidget(widget);
    await expectLater(find.byType(TimerProgress),
        matchesGoldenFile('${goldensDir}progress_75_percent.png'));
  });
}
