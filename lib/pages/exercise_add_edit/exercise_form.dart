import 'package:flutter/material.dart';

@immutable
class ExerciseForm extends StatelessWidget {
  final String pageTitle;
  final GlobalKey<FormState> formKey;
  final Widget formWidget;
  final fabTitle;
  final Function submit;

  const ExerciseForm(
      {Key key,
      @required this.pageTitle,
      @required this.formKey,
      @required this.formWidget,
      @required this.fabTitle,
      @required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: formWidget,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(fabTitle),
        onPressed: () {
          if (formKey.currentState.validate()) {
            submit.call();
          }
        },
      ),
    );
  }
}
