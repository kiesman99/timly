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
        title: Text(widget.exercise == null ? "Hinzufügen" : "Bearbeiten"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: _nameFocusNode,
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Name der Übung'),
              onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_lapsFocusNode)},
            ),
            TextField(
              focusNode: _lapsFocusNode,
              controller: _lapsController,
              inputFormatters: _numberFormatter,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              decoration: InputDecoration(hintText: 'Rundenanzahl'),
              onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_intervalFocusNode)},
            ),
            TextField(
              focusNode: _intervalFocusNode,
              controller: _intervalController,
              inputFormatters: _numberFormatter,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              decoration: InputDecoration(hintText: 'Intervall in Sekunden'),
              onSubmitted: (_) =>
                  {FocusScope.of(context).requestFocus(_recoverFocusNode)},
            ),
            TextField(
              focusNode: _recoverFocusNode,
              controller: _recoverController,
              inputFormatters: _numberFormatter,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              decoration:
                  InputDecoration(hintText: 'Erholungszeit in Senkunden'),
              onSubmitted: (_) => _submit(pageContext),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          _submit(pageContext);
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

  void _submit(BuildContext pageContext) {
    if (_valid()) {
      if (updating) {
        widget.persistenceBloc.add(PersistenceEvent.update(widget.exercise
            .copyWith(
                laps: int.parse(_lapsController.text),
                interval:
                    Duration(seconds: int.parse(_intervalController.text)),
                name: _nameController.text,
                recover:
                    Duration(seconds: int.parse(_recoverController.text)))));
      } else {
        widget.persistenceBloc.add(PersistenceEvent.add(Exercise(
            laps: int.parse(_lapsController.text),
            interval: Duration(seconds: int.parse(_intervalController.text)),
            name: _nameController.text,
            recover: Duration(seconds: int.parse(_recoverController.text)))));
      }
      Navigator.of(context).pop();
    } else {
      // TODO: add Message that all fields should be filled
    }
  }

  final List<TextInputFormatter> _numberFormatter = [
    BlacklistingTextInputFormatter(RegExp("[.|,|-]")),
    BlacklistingTextInputFormatter(RegExp("^0")),
    BlacklistingTextInputFormatter(RegExp("\s"))
  ];
}
