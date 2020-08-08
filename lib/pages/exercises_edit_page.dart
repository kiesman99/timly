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
    var formKey = useState(GlobalKey<FormState>());
    var _nameController =
        useTextEditingController(text: exercise?.name ?? "");
    var _lapsController =
        useTextEditingController(text: exercise?.laps?.toString() ?? "");
    var _nameFocusNode = useFocusNode();
    var _lapsFocusNode = useFocusNode();
    var intervalDurationController = useDurationPickerController();
    var recoverDurationController = useDurationPickerController();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(exercise == null ? 'exercise_edit.add' : 'exercise_edit.edit')
                .tr(),
      ),
      body: Builder(
        builder: (BuildContext builderContext) {
          return Form(
            key: formKey.value,
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('exercise_edit.hint_exercise').tr(),
                    subtitle: TextFormField(
                      validator: _nameValidation,
                      focusNode: _nameFocusNode,
                      controller: _nameController,
                      onFieldSubmitted: (value) {
                        _nameFocusNode.unfocus();
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('exercise_edit.hint_laps').tr(),
                    subtitle: TextFormField(
                      validator: _lapsValidation,
                      focusNode: _lapsFocusNode,
                      controller: _lapsController,
                      inputFormatters: _numberFormatter,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      onFieldSubmitted: (_) {
                        _lapsFocusNode.unfocus();
                      },
                    ),
                  ),
                  DurationPickerFormField(
                    controller: intervalDurationController,
                      title: 'exercise_edit.hint_interval_time'.tr(),
                    validator: _intervalDurationValidation,
                  ),
                  DurationPickerFormField(
                    controller: recoverDurationController,
                      title: 'exercise_edit.hint_recover_time'.tr(),),
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
              if (formKey.value.currentState.validate()) {
                _submit(
                    builderContext: builderContext,
                    context: context,
                    exercise: Exercise(
                        name: _nameController.text,
                        laps: int.parse(_lapsController.text),
                        interval: intervalDurationController.value,
                        recover: recoverDurationController.value));
              }
            },
          );
        },
      ),
    );
  }

  String _nameValidation(String name) {
    if (name.isEmpty) {
      return "Please enter a name of the exercise.";
    }
    return null;
  }

  String _lapsValidation(String laps) {
    if (laps.isEmpty) {
      return "You have to enter at least one lap";
    }
    return null;
  }

  String _intervalDurationValidation(Duration duration) {
    if (duration < const Duration(seconds: 10)) {
      return "The interval you choose has to be at least 10 seconds";
    }
    return null;
  }

  void _submit(
      {@required BuildContext builderContext,
      @required BuildContext context,
      @required Exercise exercise}) {
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
    }

  final List<TextInputFormatter> _numberFormatter = [
    FilteringTextInputFormatter.deny("[.|,|-]"),
    FilteringTextInputFormatter.deny("^0"),
    FilteringTextInputFormatter.deny("\s")
  ];
}
