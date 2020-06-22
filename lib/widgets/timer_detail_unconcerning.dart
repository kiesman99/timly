import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timly/bloc/timer/timer_bloc.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/paints/timer_progress_paint.dart';

class TimerDetailUnconcerning extends StatelessWidget {
  final TimerState state;

  TimerDetailUnconcerning({@required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is Setup) {
      return _SetupDetail((state as Setup).setupDuration.inSeconds);
    }

    TextStyle style = Theme.of(context).textTheme.headline1;
    int laps;
    int duration;

    state.maybeWhen(running: (exercise) {
      laps = exercise.laps;
      duration = exercise.interval.inSeconds;
    }, setup: (setup, exercise) {
      laps = exercise.laps;
      duration = setup.inSeconds;
    }, recover: (exercise) {
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
          child: Text("${laps}x", style: Theme.of(context).textTheme.headline6),
        ),
        Center(
            child: CustomPaint(
              painter: TimerProgressPainter(
                  intervalProgress: context
                      .bloc<TimerBloc>()
                      .intervalPercentage),
              child: Text("$duration", style: style),
            )),
      ],
    );
  }
}

class _SetupDetail extends StatefulWidget {

  final int duration;

  _SetupDetail(this.duration);

  @override
  __SetupDetailState createState() => __SetupDetailState();
}

class __SetupDetailState extends State<_SetupDetail>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  Animation _fadeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );

    _fadeAnimation = Tween(
        begin: 0.0,
        end: 1.0
    ).animate(_animationController);

    super.initState();
    _animationController.forward(from: 0.0);
  }


  @override
  void didUpdateWidget(_SetupDetail oldWidget) {
    _animationController.forward(from: 0.0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Los in...', style: Theme
                .of(context)
                .textTheme
                .headline3,),
            SizedBox(height: 30.0),
            ScaleTransition(
              scale: _fadeAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  widget.duration.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
              ),
            ),
          ],
        )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

