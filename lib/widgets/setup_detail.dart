import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/i18n/strings.g.dart';

class SetupDetail extends StatefulWidget {
  const SetupDetail({@required this.setupState});
  final Setup setupState;
  @override
  _SetupDetailState createState() => _SetupDetailState();
}

class _SetupDetailState extends State<SetupDetail> {
  Duration get _setupDuration => widget.setupState.setupDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              t.timer.starting_in,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 30.0),
            Text(
              _setupDuration.inSeconds.toString(),
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ));
  }
}
