//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:flutter_tts/flutter_tts_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:soundpool_web/soundpool_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  FlutterTtsPlugin.registerWith(registry.registrarFor(FlutterTtsPlugin));
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  SoundpoolPlugin.registerWith(registry.registrarFor(SoundpoolPlugin));
  registry.registerMessageHandler();
}
