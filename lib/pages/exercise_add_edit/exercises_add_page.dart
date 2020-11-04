part of exercise_form;

class ExerciseAddPage extends StatefulWidget {
  const ExerciseAddPage();

  static Route<void> route({@required PersistenceBloc persistenceBloc}) {
    return MaterialPageRoute<void>(builder: (_) {
      return BlocProvider<PersistenceBloc>.value(
        value: persistenceBloc,
        child: const ExerciseAddPage(),
      );
    });
  }

  @override
  _ExerciseAddPageState createState() => _ExerciseAddPageState();
}

class _ExerciseAddPageState extends State<ExerciseAddPage>
    with ExerciseFormValidationMixin<ExerciseAddPage> {
  PersistenceBloc _persistenceBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final TextEditingController _lapsController = TextEditingController();
  final FocusNode _lapsFocusNode = FocusNode();
  final DurationPickerController _intervalDurationController =
      DurationPickerController();
  final DurationPickerController _recoverDurationController =
      DurationPickerController();

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
            keyboardType:
                TextInputType.numberWithOptions(decimal: false, signed: false),
            onFieldSubmitted: (_) {
              _lapsFocusNode.unfocus();
            },
          ),
        ),
        DurationPickerFormField(
          themeData: durationPickerTheme,
          controller: _intervalDurationController,
          title: t.exercise_edit.hint_interval_time,
          validator: intervalDurationValidation,
        ),
        DurationPickerFormField(
          themeData: durationPickerTheme,
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
    final exercise = Exercise(
        name: _nameController.text,
        laps: int.parse(_lapsController.text),
        interval: _intervalDurationController.value,
        recover: _recoverDurationController.value);
    _persistenceBloc.add(PersistenceEvent.add(exercise));
    Navigator.of(context).pop();
  }
}
