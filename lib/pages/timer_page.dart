import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {

  final Duration intervalDuration;
  final Duration recoverDuration;
  final Duration preTimer;
  final int laps;

  TimerPage({
    @required this.intervalDuration,
    @required this.recoverDuration,
    @required this.preTimer,
    @required this.laps
  });

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  Timer _timer;

  bool _hasStarted = false;

  bool _isRecovering = false;

  bool _isPaused = false;
  
  int _lap;

  int _seconds;

  @override
  void initState() {
    _seconds = 1;
    _lap = widget.laps;
    _timer = new Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if(_hasStarted && !_isPaused && _lap != 0) {
        if(_isRecovering) {
          _seconds++;
          if(_seconds == widget.recoverDuration.inSeconds + 1){
            _isRecovering = false;
            _seconds = widget.intervalDuration.inSeconds;
          }
        } else {
          _seconds--;
          if(_seconds == 0) {
            _isRecovering = true;
            _lap--;
          }
        }
      } else {
        // Pre Timer is handled here
        if(_seconds == widget.preTimer.inSeconds) {
          _seconds = widget.intervalDuration.inSeconds;
          _hasStarted = true;
        }
          _seconds++;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timly"),
      ),
      body: _lap == 0 ? Center(
        child: Text("Finished!", style: finishText),
      ) : Stack(
        children: [
          Positioned(
            top: 20.0,
            right: 20.0,
            child: Text("${_lap}x", style: intervalStyle),
          ),
          Center(
            child: Text(
              "$_seconds${_hasStarted ? '' : '...'}", 
              style: timerStyle.copyWith(color: _isRecovering ? Colors.red : _hasStarted ? Colors.black : Colors.blue)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(!_isPaused ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          setState(() {
            _isPaused = !_isPaused;
          });
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
