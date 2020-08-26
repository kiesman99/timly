import 'package:flutter/material.dart';

@immutable
class TimerFinished extends StatelessWidget {
  const TimerFinished();
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Finished'),
    );
  }
}
