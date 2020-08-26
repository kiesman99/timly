import 'package:flutter/material.dart';
import 'package:tyme/pages/timer/widgets/timer_progress/timer_progress.dart';

@immutable
class TimerDetail extends StatefulWidget {
  const TimerDetail(
      {@required this.laps,
      this.headerLabel = '',
      @required this.durationLeft,
      @required this.progressIndicatorColor,
      @required this.progressInervalPercentage,
      this.backgroundColor = Colors.transparent});

  final int laps;
  final String headerLabel;
  final int durationLeft;
  final Color backgroundColor;
  final Color progressIndicatorColor;
  final double progressInervalPercentage;

  @override
  _TimerDetailState createState() => _TimerDetailState();
}

class _TimerDetailState extends State<TimerDetail>
    with TickerProviderStateMixin {
  AnimationController backgroundAnimationController;
  Animation<Color> backgroundAnimation;

  @override
  void initState() {
    super.initState();
    backgroundAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    backgroundAnimation =
        ColorTween(begin: widget.backgroundColor, end: widget.backgroundColor)
            .animate(backgroundAnimationController);
  }

  @override
  void didUpdateWidget(covariant TimerDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.backgroundColor != widget.backgroundColor) {
      print('Something changed...');
      backgroundAnimation = ColorTween(
              begin: oldWidget.backgroundColor, end: widget.backgroundColor)
          .animate(backgroundAnimationController);
      backgroundAnimationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    backgroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: widget.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                child: Text('${widget.laps}x'),
              )
            ],
          ),
          Text(widget.headerLabel,
              style: Theme.of(context).textTheme.headline3),
          Expanded(
            child: Center(
              child: TimerProgress(
                indicatorColor: widget.progressIndicatorColor,
                intervalProgress: widget.progressInervalPercentage,
                durationLeft: '${widget.durationLeft}',
              ),
            ),
          )
        ],
      ),
    );
  }
}
