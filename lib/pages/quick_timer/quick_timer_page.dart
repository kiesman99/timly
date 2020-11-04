import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:picky/picky.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/timer/timer_page.dart';
import 'package:tyme/theme/app_theme.dart';

class QuickTimerPage extends StatefulWidget {
  const QuickTimerPage();
  @override
  _QuickTimerPageState createState() => _QuickTimerPageState();
}

class _QuickTimerPageState extends State<QuickTimerPage> {
  final TextEditingController lapsTextEditingController =
      TextEditingController();
  final DurationPickerController intervalDurationPickerController =
      DurationPickerController();
  final DurationPickerController recoverDurationPickerController =
      DurationPickerController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.quick_timer_page.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(t.quick_timer_page.hint_laps),
                subtitle: TextFormField(
                  // ignore: missing_return
                  validator: _lapsValidation,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  controller: lapsTextEditingController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DurationPickerFormField(
                themeData: durationPickerTheme,
                controller: intervalDurationPickerController,
                title: t.quick_timer_page.hint_interval,
                validator: _intervalDurationValidation,
              ),
              const SizedBox(
                height: 20,
              ),
              DurationPickerFormField(
                themeData: durationPickerTheme,
                controller: recoverDurationPickerController,
                title: t.quick_timer_page.hint_recover,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // TODO: add translation
        label: const Text('Los'),
        onPressed: () async {
          if (formKey.currentState.validate() == true) {
            final exercise = Exercise(
                laps: int.parse(lapsTextEditingController.text),
                interval: intervalDurationPickerController.value,
                recover: recoverDurationPickerController.value);

            await Navigator.of(context)
                .push(TimerPage.route(exercise: exercise));
          }
        },
      ),
    );
  }

  String _lapsValidation(String value) {
    if (value.isEmpty) {
      return t.errors.textfield_empty;
    }
    final num = int.tryParse(value);

    if (num == null) {
      return t.errors.not_a_number;
    }

    if (num < 1) {
      return t.errors.laps_lower_one;
    }

    return null;
  }

  String _intervalDurationValidation(Duration duration) {
    if (duration < const Duration(seconds: 10)) {
      return t.errors.interval_lower_ten_seconds;
    }
    return null;
  }
}
