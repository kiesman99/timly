import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:timly/utils/custom_timer.dart';

class RealTimer extends CustomTimer {

  RealTimer({
    @required Duration interval
  }) : super(interval);

  @override
  void start() {
    timer = Timer.periodic(interval, (timer) => callback.call());
  }

  @override
  void stop() {
    timer?.cancel();
    timer = null;
  }

}