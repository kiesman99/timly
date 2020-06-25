import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/model/exercise.dart';
import 'package:timly/paints/timer_progress_paint.dart';

class TimerDetailUnconcerning extends StatelessWidget {
  final TimerState state;

  TimerDetailUnconcerning({@required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is Setup) {
      return _SetupDetail((state as Setup).setupDuration.inSeconds);
    } else {
      return _TimerDetail(state: state);
    }
  }
}

class _TimerDetail extends StatefulWidget {
  final TimerState state;

  _TimerDetail({@required this.state});

  @override
  __TimerDetailState createState() => __TimerDetailState();
}

// TODO: Tidy animation
class __TimerDetailState extends State<_TimerDetail>
    with TickerProviderStateMixin {
  AnimationController _initAnimationController;
  Animation _initAnimation;

  AnimationController _progressAnimationController;
  Animation _progressAnimation;

  @override
  void initState() {
    _initAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _initAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOutQuint))
        .animate(_initAnimationController);

    _progressAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    _progressAnimation = Tween(
            begin: (widget.state.remaining.interval.inSeconds /
                    context.read<Exercise>().interval.inSeconds) *
                100.0,
            end: (widget.state.remaining.interval.inSeconds /
                    context.read<Exercise>().interval.inSeconds) *
                100.0)
        .animate(_progressAnimationController);

    super.initState();
    _initAnimationController.forward(from: 0.0);
    _progressAnimationController.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(_TimerDetail oldWidget) {
    if (widget.state is Running) {
      _progressAnimation = Tween(
              begin: (oldWidget.state.remaining.interval.inSeconds /
                      context.read<Exercise>().interval.inSeconds) *
                  100.0,
              end: (widget.state.remaining.interval.inSeconds /
                      context.read<Exercise>().interval.inSeconds) *
                  100.0)
          .animate(_progressAnimationController);
      _progressAnimationController.forward(from: 0.0);
    } else {
      _progressAnimation =
          Tween(begin: 100.0, end: 100.0).animate(_progressAnimationController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.headline1;
    int laps;
    int duration;

    widget.state.maybeWhen(running: (exercise) {
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
            child: ScaleTransition(
              scale: _initAnimation,
              child: AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: (widget.state is Recover) ? TimerProgressPainter
                        .recover(
                        intervalProgress: 100.0) : TimerProgressPainter(
                        intervalProgress: _progressAnimation.value),
                    child: child,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.state is Recover) Text('Pause', style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.amber[300],
                        fontWeight: FontWeight.bold)),
                    Text("$duration", style: style)
                  ],
                ),
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _initAnimationController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
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
            Text('Start in...', style: Theme
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

