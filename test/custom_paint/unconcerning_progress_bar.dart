import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timly/widgets/timer_progress_unconcerning_widget.dart';

void main() {

  Widget createDefaultProgressBar() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
          child: RepaintBoundary(
        child: TimerProgressUnconcerningWidget(),
      )),
    );
  }

  Widget createWidgetWithCustomPercentage(double percentage) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
          child: RepaintBoundary(
        child: TimerProgressUnconcerningWidget(
          intervalProgress: percentage,
        ),
      )),
    );
  }

  Widget createWidgetWithCustomRadius(double radius) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
          child: RepaintBoundary(
        child: TimerProgressUnconcerningWidget(
          radiusPercentage: radius,
        ),
      )),
    );
  }

  Widget createWidgetWithCustomText(String text, [bool recover = false]) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        color: Colors.white,
        child: Center(
          child: RepaintBoundary(
        child: recover ? TimerProgressUnconcerningWidget.recover(text: text) : TimerProgressUnconcerningWidget(text: text),
      )),
      ),
    );
  }

  testWidgets('default', (WidgetTester tester) async {
    Widget widget = createDefaultProgressBar();
    await tester.pumpWidget(widget);
    await expectLater(
      find.byType(TimerProgressUnconcerningWidget),
      matchesGoldenFile('golden/defaultThermometerGoldenImage.png'),
      skip: !Platform.isLinux,
    );
  });

  group('custom percentage', () {
    void testCustomPercentage(double percentage) {
      testWidgets('$percentage%', (WidgetTester tester) async {
        Widget widget = createWidgetWithCustomPercentage(percentage);
        await tester.pumpWidget(widget);
        await expectLater(
          find.byType(TimerProgressUnconcerningWidget),
          matchesGoldenFile("golden/customPercentage_$percentage.png"),
        );
      });
    }

    testCustomPercentage(50.0);
    testCustomPercentage(75.0);
    testCustomPercentage(25.0);
    testCustomPercentage(0.0);
    testCustomPercentage(77.67);
  });

  group('custom radius', () {
    void testCustomRadius(double radius) {
      testWidgets('$radius%', (WidgetTester tester) async {
        Widget widget = createWidgetWithCustomRadius(radius);
        await tester.pumpWidget(widget);
        await expectLater(
          find.byType(TimerProgressUnconcerningWidget),
          matchesGoldenFile("golden/customRadius_$radius.png"),
        );
      });
    }

    testCustomRadius(0.0);
    testCustomRadius(1.0);
    testCustomRadius(0.5);
    testCustomRadius(0.25);
  });

  // TODO: make l10n working in test
  group('custom text', () {
    void testCustomText(String text, [String description = ""]) {
      testWidgets("$text - $description", (WidgetTester tester) async {
        Widget widget = createWidgetWithCustomText(text);
        Widget recoverWidget = createWidgetWithCustomText(text, true);
        await tester.pumpWidget(widget);
        await expectLater(find.byType(TimerProgressUnconcerningWidget),
            matchesGoldenFile("golden/customText_${text}_$description.png"));
        await tester.pumpWidget(recoverWidget);
        await expectLater(find.byType(TimerProgressUnconcerningWidget),
            matchesGoldenFile("golden/customText_recover_${text}_$description.png"));
      });
    }

    testCustomText("9s", "one digits");
    testCustomText("28s", "two digits");
    testCustomText("175s", "three digits");
    testCustomText("6968s", "four digits");
  }, skip: true);
}
