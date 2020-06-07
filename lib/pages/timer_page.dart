import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timly/model/TimlyState.dart';
import 'package:timly/model/timly_model.dart';
import 'package:timly/provider/timer_provider.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timly"),
      ),
      body:  Consumer<TimerProvider>(
        builder: (context, provider, child) {
          TimlyState timlyState = provider.state.state;
          if (timlyState == TimlyState.PAUSED) {
            return Center(
              child: Text("PAUSED!", style: finishText),
            );
          } else if (timlyState == TimlyState.FINISHED) {
            return Center(
              child: Text("FINISHED!", style: finishText),
            );
          }

          return Stack(
            children: [
              Positioned(
                top: 20.0,
                right: 20.0,
                child: Text("${context.watch<TimerProvider>().laps}x", style: intervalStyle),
              ),
              Center(
                child: CounterWidget(state: provider.state),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(context.watch<TimerProvider>().state.state == TimlyState.PAUSED ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          if (context.read<TimerProvider>().state.state == TimlyState.PAUSED) {
            context.read<TimerProvider>().resume();
          } else {
            context.read<TimerProvider>().pause();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CounterWidget extends StatelessWidget {

  final TimlyModel state;

  CounterWidget({
    @required this.state
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = timerStyle;

    if(state.state == TimlyState.RUNNING) {
      style = style.copyWith(color: Colors.black);
    } else if (state.state == TimlyState.SETUP) {
      style = style.copyWith(color: Colors.green);
    } else if (state.state == TimlyState.RECOVER) {
      style = style.copyWith(color: Colors.red);
    }

    return Text("${state.duration.inSeconds}", style: style);
  }
}


var finishText = TextStyle(
  fontSize: 70.0
);

var intervalStyle = TextStyle(
  fontSize: 50.0
);

var timerStyle = TextStyle(
  fontSize: 120.0
);
