import 'dart:io';

extension PlatformExtension on Platform {

  static final bool isMobile = Platform.isAndroid || Platform.isIOS;

}