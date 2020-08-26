import 'package:flutter/material.dart';

@immutable
class TimerPaused extends StatelessWidget {
  const TimerPaused();
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Paused'),
    );
  }
}
