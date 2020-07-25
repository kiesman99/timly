import 'dart:io';

class Device {

  static bool get isMobile => Platform.isAndroid || Platform.isIOS;

}