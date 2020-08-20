import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData appTheme = ThemeData(
      primarySwatch: Colors.teal,
      backgroundColor: Colors.teal[700],
      scaffoldBackgroundColor: Colors.teal[700],
      appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.teal[700]),
      primaryTextTheme:
      TextTheme(bodyText1: TextStyle(color: Colors.white)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal[800], width: 3.0)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal[400], width: 3.0)),
        hintStyle: TextStyle(
          color: Colors.teal[300],
          fontSize: 40.0,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 100.0, color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(fontSize: 60.0, color: Colors.white),
        headline4: TextStyle(fontSize: 40.0, color: Colors.white),
        headline5: TextStyle(fontSize: 30.0, color: Colors.white),
        headline6: TextStyle(fontSize: 18.0, color: Colors.white),
        subtitle1: TextStyle(fontSize: 20.0, color: Colors.white),
        // ListTile title
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        overline: TextStyle(color: Colors.white),
      ));

  static var durationPickerTheme = BottomSheetDurationPickerThemeData(
      bottomSheetThemeData: BottomSheetThemeData(
        backgroundColor: appTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    dialpadTextStyle: TextStyle(color: Colors.white),
    pickedDurationTextStyle: appTheme.textTheme.headline4.copyWith(
        color: Colors.white
    ),
    labelStyle: appTheme.textTheme.headline6.copyWith(
        color: Colors.white
    ),
    dialpadLeftIconColor: Colors.white
  );
}