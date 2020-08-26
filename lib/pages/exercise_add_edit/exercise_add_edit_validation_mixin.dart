import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyme/i18n/strings.g.dart';
import 'package:meta/meta.dart';

@protected
mixin ExerciseFormValidationMixin<T extends StatefulWidget> on State<T> {
  String nameValidation(String name) {
    if (name.isEmpty) {
      return t.errors.textfield_empty;
    }
    return null;
  }

  String lapsValidation(String laps) {
    if (laps.isEmpty) {
      return t.errors.textfield_empty;
    }
    final int number = int.tryParse(laps);
    if (number == null) {
      return t.errors.not_a_number;
    }
    if (number < 1) {
      return t.errors.laps_lower_one;
    }
    return null;
  }

  String intervalDurationValidation(Duration duration) {
    if (duration < const Duration(seconds: 10)) {
      return t.errors.interval_lower_ten_seconds;
    }
    return null;
  }

  final List<TextInputFormatter> numberFormatter = [
    FilteringTextInputFormatter.deny(r'[.|,|-]'),
    FilteringTextInputFormatter.deny(r'^0'),
    FilteringTextInputFormatter.deny('\s')
  ];

  void submit();
  Widget form();
  String get pageTitle;
  GlobalKey<FormState> get formKey;
  String get fabTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: form(),
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
