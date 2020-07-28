//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:soundpool_web/soundpool_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  SoundpoolPlugin.registerWith(registry.registrarFor(SoundpoolPlugin));
  registry.registerMessageHandler();
}
