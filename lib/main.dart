import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyme/pages/main_page/main_page.dart';
import 'package:tyme/theme/app_theme.dart';

import 'i18n/strings.g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocaleSettings.useDeviceLocale().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tyme', theme: appTheme, home: MainPage());
  }
}
