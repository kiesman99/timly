import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timly/bloc/persistence/persistence_bloc.dart';
import 'package:timly/bloc/persistence/persistence_event.dart';
import 'package:timly/model/exercise.dart';

class ExercisesEditPage extends StatefulWidget {
  final PersistenceBloc persistenceBloc;
  final Exercise exercise;

  ExercisesEditPage({@required this.persistenceBloc, this.exercise});

  @override
  _ExercisesEditPageState createState() => _ExercisesEditPageState();
}

class _ExercisesEditPageState extends State<ExercisesEditPage> {
  bool get updating => widget.exercise != null;

  final errorSnackbar = SnackBar(
      content: Text('exercise_edit.error_fill_all_fields').tr(),
      backgroundColor: Colors.red);

  TextEditingController _nameController;
  TextEditingController _intervalController;
  TextEditingController _recoverController;
  TextEditingController _lapsController;
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _intervalFocusNode = FocusNode();
  FocusNode _recoverFocusNode = FocusNode();
  FocusNode _lapsFocusNode = FocusNode();

  @override
  void initState() {
    _nameController =
    new TextEditingController(text: widget.exercise?.name ?? "");
    _intervalController = new TextEditingController(
        text: widget.exercise?.interval?.inSeconds?.toString() ?? "");
    _recoverController = new TextEditingController(
        text: widget.exercise?.recover?.inSeconds?.toString() ?? "");
    _lapsController = new TextEditingController(
        text: widget.exercise?.laps?.toString() ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext pageContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise == null
                ? 'exercise_edit.add'
                : 'exercise_edit.edit')
            .tr(),
      ),
      body: Builder(
        builder: (BuildContext builderContext) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  focusNode: _nameFocusNode,
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'exercise_edit.hint_exercise'.tr()),
                  onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_lapsFocusNode)},
                ),
                TextField(
                  focusNode: _lapsFocusNode,
                  controller: _lapsController,
                  inputFormatters: _numberFormatter,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  decoration: InputDecoration(
                      hintText: 'exercise_edit.hint_laps'.tr(),
                      suffixText: 'x'),
                  onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_intervalFocusNode)},
                ),
                TextField(
                  focusNode: _intervalFocusNode,
                  controller: _intervalController,
                  inputFormatters: _numberFormatter,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  decoration: InputDecoration(
                      hintText: 'exercise_edit.hint_interval_time'.tr(),
                      suffixText: "s"),
                  onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_recoverFocusNode)},
                ),
                TextField(
                  focusNode: _recoverFocusNode,
                  controller: _recoverController,
                  inputFormatters: _numberFormatter,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  decoration: InputDecoration(
                      hintText: 'exercise_edit.hint_recover_time'.tr(),
                      suffixText: 's'),
                  onSubmitted: (_) => _submit(builderContext),
                )
              ],
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
              _submit(builderContext);
            },
          );
        },
      ),
    );
  }

  bool _valid() {
    return (_nameController.text.isNotEmpty &&
        _lapsController.text.isNotEmpty &&
        _intervalController.text.isNotEmpty &&
        _recoverController.text.isNotEmpty);
  }

  void _submit(BuildContext builderContext) {
    if (_valid()) {
      if (updating) {
        print("Updating ${widget.exercise.key}");

        Exercise e = widget.exercise;
        e.name = _nameController.text;
        e.laps = int.parse(_lapsController.text);
        e.interval = Duration(seconds: int.parse(_intervalController.text));
        e.recover = Duration(seconds: int.parse(_recoverController.text));
        widget.persistenceBloc.add(PersistenceEvent.update(e));
      } else {
        widget.persistenceBloc.add(PersistenceEvent.add(Exercise(
            laps: int.parse(_lapsController.text),
            interval: Duration(seconds: int.parse(_intervalController.text)),
            name: _nameController.text,
            recover: Duration(seconds: int.parse(_recoverController.text)))));
      }
      Navigator.of(context).pop();
    } else {
      Scaffold.of(builderContext).showSnackBar(errorSnackbar);
    }
  }

  final List<TextInputFormatter> _numberFormatter = [
    BlacklistingTextInputFormatter(RegExp("[.|,|-]")),
    BlacklistingTextInputFormatter(RegExp("^0")),
    BlacklistingTextInputFormatter(RegExp("\s"))
  ];
}
