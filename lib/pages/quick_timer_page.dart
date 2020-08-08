import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/sound/sound_bloc.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/pages/timer_page.dart';
import 'package:tyme/theme.dart';

class QuickTimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final lapsTextEditingController = useTextEditingController();
    final intervalDurationPickerController = useDurationPickerController();
    final recoverDurationPickerController = useDurationPickerController();
    var formKey = useState(GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        title: Text('quick_timer_page.title').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Form(
          key: formKey.value,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('quick_timer_page.hint_laps').tr(),
                subtitle: TextFormField(
                  // ignore: missing_return
                  validator: _lapsValidation,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  controller: lapsTextEditingController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DurationPickerFormField(
                controller: intervalDurationPickerController,
                title: 'quick_timer_page.hint_interval'.tr(),
                validator: _intervalDurationValidation,
              ),
              SizedBox(
                height: 20,
              ),
              DurationPickerFormField(
                controller: recoverDurationPickerController,
                title: 'quick_timer_page.hint_recover'.tr(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Los'),
        onPressed: () {
          if (formKey.value.currentState.validate()) {
            var e = Exercise(
                laps: int.parse(lapsTextEditingController.text),
                interval: intervalDurationPickerController.value,
                recover: recoverDurationPickerController.value);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Provider.value(
                      value: e,
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) =>
                                TimerBloc(e, context.bloc<SoundBloc>()),
                          ),
                          BlocProvider(
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
      return "Es muss eine Rundenanzahl angegeben werden";
    }
    int num;
    try {
      num = int.tryParse(value);
    } catch (e, s) {
      return "Die Rundenanzahl war keine Zahl";
    }

    if (num < 1) {
      return "Es muss wenigstens eine Runde angebenen werden";
    }

    return null;
  }

  String _intervalDurationValidation(Duration duration) {
    if (duration < const Duration(seconds: 10)) {
      return "The duration has to be at least 10 seconds";
    }
    return null;
  }
}
