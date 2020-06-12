import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timly/bloc/timer/timer_bloc.dart';
import 'package:timly/bloc/timer/timer_event.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/paints/timer_progress_paint.dart';

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
      body: BlocBuilder<TimerBloc, TimerState>(
        builder: (BuildContext context, TimerState state) {
          if (state is Paused) {
            return Center(
              child: Text("Paused!", style: finishText),
            );
          } else if (state is Finished) {
            return Center(
              child: Text("Finished!", style: finishText),
            );
          } else {
            return CounterWidget(state: state);
          }
        },
      ),
      floatingActionButton: BlocBuilder<TimerBloc, TimerState>(
        builder: (BuildContext context, TimerState state) {
          return state.maybeWhen(
            paused: (_) {
              return FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () {
                  context.bloc<TimerBloc>().add(TimerEvent.resume());
                },
              );
            },
            finished: () {
              return FloatingActionButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  context.bloc<TimerBloc>().add(TimerEvent.replay());
                },
              );
            },
            orElse: () {
              return FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () {
                  context.bloc<TimerBloc>().add(TimerEvent.pause());
                },
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CounterWidget extends StatelessWidget {
  final TimerState state;

  CounterWidget({@required this.state});

  @override
  Widget build(BuildContext context) {
    TextStyle style = timerStyle;
    int laps;
    int duration;

    state.maybeWhen(running: (exercise) {
      style = style.copyWith(color: Colors.black);
      laps = exercise.laps;
      duration = exercise.interval.inSeconds;
    }, setup: (setup, exercise) {
      style = style.copyWith(color: Colors.green);
      laps = exercise.laps;
      duration = setup.inSeconds;
    }, recover: (exercise) {
      style = style.copyWith(color: Colors.red);
      laps = exercise.laps;
      duration = exercise.recover.inSeconds;
    }, orElse: () {
      laps = 0;
      duration = 0;
    });

    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          child: Text("${laps}x", style: intervalStyle),
        ),
        Center(
            child: CustomPaint(
          painter: TimerProgressPainter(
              lapPercentage: context.bloc<TimerBloc>().lapPercentage,
              intervalProgress: context.bloc<TimerBloc>().intervalPercentage,
              setupProgress: context.bloc<TimerBloc>().setupPercentage,
              recoverProgress: context.bloc<TimerBloc>().recoverPercentage),
          child: Text("$duration", style: style),
        )),
      ],
    );
  }
}

var finishText = TextStyle(fontSize: 70.0);

var intervalStyle = TextStyle(fontSize: 50.0);

var timerStyle = TextStyle(fontSize: 120.0);
