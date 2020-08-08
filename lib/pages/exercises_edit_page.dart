import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/model/exercise.dart';

class ExercisesEditPage extends HookWidget {
  final PersistenceBloc persistenceBloc;
  final Exercise exercise;

  bool get updating => exercise.name.isNotEmpty;

  final errorSnackbar = SnackBar(
      content: Text('exercise_edit.error_fill_all_fields').tr(),
      backgroundColor: Colors.red);

  ExercisesEditPage({@required this.persistenceBloc, this.exercise});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController =
        useTextEditingController(text: exercise?.name ?? "");
    TextEditingController _lapsController =
        useTextEditingController(text: exercise?.laps?.toString() ?? "");
    FocusNode _nameFocusNode = useFocusNode();
    FocusNode _lapsFocusNode = useFocusNode();
    var recoverDuration =
        useState(Duration(seconds: exercise?.recover?.inSeconds ?? 0));
    var intervalDuration =
        useState(Duration(seconds: exercise?.interval?.inSeconds ?? 0));

    return Scaffold(
      appBar: AppBar(
        title:
            Text(exercise == null ? 'exercise_edit.add' : 'exercise_edit.edit')
                .tr(),
      ),
      body: Builder(
        builder: (BuildContext builderContext) {
          return Form(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ListTile(
                    title: Text('exercise_edit.hint_exercise').tr(),
                    subtitle: TextFormField(
                      focusNode: _nameFocusNode,
                      controller: _nameController,
                    ),
                  ),
                  ListTile(
                    title: Text('exercise_edit.hint_laps').tr(),
                    subtitle: TextFormField(
                      focusNode: _lapsFocusNode,
                      controller: _lapsController,
                      inputFormatters: _numberFormatter,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                    ),
                  ),
                  DurationPickerFormField(title: 'exercise_edit.hint_interval_time'.tr(), onSaved: (duration) => intervalDuration.value = duration),
                  DurationPickerFormField(title: 'exercise_edit.hint_recover_time'.tr(), onSaved: (duration) => recoverDuration.value = duration),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (BuildContext builderContext) {
          return FloatingActionButton.extended(
            label: Text('exercise_edit.button_save').tr(),
            onPressed: () {
              _submit(
                  builderContext: builderContext,
                  context: context,
                  exercise: Exercise(
                      name: _nameController.text,
                      laps: int.parse(_lapsController.text),
                      interval: intervalDuration.value,
                      recover: recoverDuration.value));
            },
          );
        },
      ),
    );
  }

  void _submit(
      {@required BuildContext builderContext,
      @required BuildContext context,
      @required Exercise exercise}) {
    // TODO: DO VALIDATION
    if (true) {
      if (updating) {
        print("Updating ${exercise.key}");
        Exercise e = this.exercise;
        e.name = exercise.name;
        e.laps = exercise.laps;
        e.interval = exercise.interval;
        e.recover = exercise.recover;
        persistenceBloc.add(PersistenceEvent.update(exercise));
      } else {
        persistenceBloc.add(PersistenceEvent.add(exercise));
      }
      Navigator.of(context).pop();
    } else {
      Scaffold.of(builderContext).showSnackBar(errorSnackbar);
    }
  }

  final List<TextInputFormatter> _numberFormatter = [
    FilteringTextInputFormatter.deny("[.|,|-]"),
    FilteringTextInputFormatter.deny("^0"),
    FilteringTextInputFormatter.deny("\s")
  ];
}
