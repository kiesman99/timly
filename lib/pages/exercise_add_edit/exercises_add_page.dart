import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyme/bloc/persistence/persistence_bloc.dart';
import 'package:tyme/bloc/persistence/persistence_event.dart';
import 'package:tyme/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyme/pages/exercise_add_edit/exercise_add_edit_validation_mixin.dart';

import 'exercise_form.dart';

class ExerciseAddPage extends StatefulWidget {
  @override
  _ExerciseAddPageState createState() => _ExerciseAddPageState();
}

class _ExerciseAddPageState extends State<ExerciseAddPage>
    with ExerciseFormValidationMixin {
  PersistenceBloc _persistenceBloc;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  TextEditingController _lapsController = TextEditingController();
  FocusNode _lapsFocusNode = FocusNode();
  DurationPickerController _intervalDurationController =
      DurationPickerController.zero();
  DurationPickerController _recoverDurationController =
      DurationPickerController.zero();

  @override
  void initState() {
    super.initState();
    _persistenceBloc = context.bloc<PersistenceBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return ExerciseForm(
      pageTitle: t.exercise_edit.add,
      fabTitle: t.exercise_edit.button_save,
      formKey: _formKey,
      submit: _submit,
      formWidget: ListView(
        children: <Widget>[
          ListTile(
            title: Text(t.exercise_edit.hint_exercise),
            subtitle: TextFormField(
              validator: nameValidation,
              focusNode: _nameFocusNode,
              controller: _nameController,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
              },
            ),
          ),
          ListTile(
            title: Text(t.exercise_edit.hint_laps),
            subtitle: TextFormField(
              validator: lapsValidation,
              focusNode: _lapsFocusNode,
              controller: _lapsController,
              inputFormatters: numberFormatter,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              onFieldSubmitted: (_) {
                _lapsFocusNode.unfocus();
              },
            ),
          ),
          DurationPickerFormField(
            controller: _intervalDurationController,
            title: t.exercise_edit.hint_interval_time,
            validator: intervalDurationValidation,
          ),
          DurationPickerFormField(
            controller: _recoverDurationController,
            title: t.exercise_edit.hint_recover_time,
          ),
        ],
      ),
    );
  }

  void _submit() {
    Exercise exercise = Exercise(
      name: _nameController.text,
      laps: int.parse(_lapsController.text),
      interval: _intervalDurationController.value,
      recover: _recoverDurationController.value
    );
    _persistenceBloc.add(PersistenceEvent.add(exercise));
    Navigator.of(context).pop();
  }
}
