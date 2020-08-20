part of exercise_form;

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
  String get fabTitle => t.exercise_edit.button_save;

  @override
  Widget form() {
    return ListView(
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
          themeData: AppTheme.durationPickerTheme,
          controller: _intervalDurationController,
          title: t.exercise_edit.hint_interval_time,
          validator: intervalDurationValidation,
        ),
        DurationPickerFormField(
          themeData: AppTheme.durationPickerTheme,
          controller: _recoverDurationController,
          title: t.exercise_edit.hint_recover_time,
        ),
      ],
    );
  }

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get pageTitle => t.exercise_edit.add;

  @override
  void submit() {
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
