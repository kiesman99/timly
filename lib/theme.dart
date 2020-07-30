import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:flutter/material.dart';

BottomSheetDurationPickerThemeData bottomSheetDurationPickerTheme(
        BuildContext context) =>
    BottomSheetDurationPickerThemeData(
        bottomSheetThemeData: BottomSheetThemeData(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.0))),
            elevation: 15.0),
        labelStyle: TextStyle(color: Colors.white, fontSize: 27.0),
        pickedDurationTextStyle: TextStyle(color: Colors.white, fontSize: 35.0),
        dialpadTextStyle: TextStyle(color: Colors.white));
