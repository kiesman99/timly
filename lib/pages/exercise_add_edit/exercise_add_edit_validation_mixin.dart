import 'package:flutter/services.dart';
import 'package:tyme/i18n/strings.g.dart';

class ExerciseFormValidationMixin {

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
    var number = int.tryParse(laps);
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
    FilteringTextInputFormatter.deny("[.|,|-]"),
    FilteringTextInputFormatter.deny("^0"),
    FilteringTextInputFormatter.deny("\s")
  ];

}