import 'dart:io';

import 'package:flutter/foundation.dart';

bool get isMobile {
  if (kIsWeb) {
    return false;
  }

  return Platform.isAndroid || Platform.isAndroid;
}
