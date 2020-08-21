import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/timer_page.dart';
import 'package:tyme/service/tts_service.dart';
import 'package:tyme/theme/app_theme.dart';

class QuickTimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController lapsTextEditingController =
        useTextEditingController();
    final DurationPickerController intervalDurationPickerController =
        useDurationPickerController();
    final DurationPickerController recoverDurationPickerController =
        useDurationPickerController();
    final ValueNotifier<GlobalKey<FormState>> formKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        title: Text(t.quick_timer_page.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Form(
          key: formKey.value,
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
                themeData: AppTheme.durationPickerTheme,
                controller: intervalDurationPickerController,
                title: t.quick_timer_page.hint_interval,
                validator: _intervalDurationValidation,
              ),
              const SizedBox(
                height: 20,
              ),
              DurationPickerFormField(
                themeData: AppTheme.durationPickerTheme,
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
          if (formKey.value.currentState.validate() == true) {
            var e = Exercise(
                laps: int.parse(lapsTextEditingController.text),
                interval: intervalDurationPickerController.value,
                recover: recoverDurationPickerController.value);

            Navigator.of(context).push<void>(MaterialPageRoute<void>(
                builder: (_) => Provider<Exercise>.value(
                      value: e,
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider<TimerBloc>(
                            create: (_) => TimerBloc(e, TTSService()),
                          ),
                          BlocProvider<BurnInBloc>(
                            create: (_) => BurnInBloc(),
                          )
                        ],
                        child: TimerPage(),
                      ),
                    )));
          }
        },
      ),
    );
  }

  String _lapsValidation(String value) {
    if (value.isEmpty) {
      return t.errors.textfield_empty;
    }
    final int num = int.tryParse(value);

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
