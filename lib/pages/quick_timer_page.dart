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
    var intervalDuration = useState(Duration(seconds: 0));
    var recoverDuration = useState(Duration(seconds: 0));

    return Scaffold(
      appBar: AppBar(
        title: Text('quick_timer_page.title').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text('quick_timer_page.hint_laps').tr(),
              subtitle: TextField(
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: lapsTextEditingController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('quick_timer_page.hint_interval').tr(),
              subtitle: Text("${intervalDuration.value.inSeconds}s"),
              onTap: () async {
                intervalDuration.value = await showDurationPickerBottomSheet(
                        context: context,
                        label: 'quick_timer_page.hint_interval'.tr(),
                        themeData: bottomSheetDurationPickerTheme(context)) ??
                    intervalDuration.value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('quick_timer_page.hint_recover').tr(),
              subtitle: Text("${recoverDuration.value.inSeconds}s"),
              onTap: () async {
                recoverDuration.value = await showDurationPickerBottomSheet(
                        context: context,
                        label: 'quick_timer_page.hint_recover'.tr(),
                        themeData: bottomSheetDurationPickerTheme(context)) ??
                    recoverDuration.value;
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Los'),
        onPressed: () {
          var e = Exercise(
              laps: int.parse(lapsTextEditingController.text),
              interval: intervalDuration.value,
              recover: recoverDuration.value,
              name: "");

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
                      child: TimerPage(
                          //exercise: e,
                          ),
                    ),
                  )));
        },
      ),
    );
  }
}
