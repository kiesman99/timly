import 'dart:async';

import 'package:flutter/material.dart';
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
      body: context.watch<TimerProvider>().laps == 0 ? Center(
        child: Text("Finished!", style: finishText),
      ) : Stack(
        children: [
          Positioned(
            top: 20.0,
            right: 20.0,
            child: Text("${context.watch<TimerProvider>().laps}x", style: intervalStyle),
          ),
          Center(
            child: Text("${(context.watch<TimerProvider>().displayDuration).inSeconds}"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(true ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          context.read<TimerProvider>().pause();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
