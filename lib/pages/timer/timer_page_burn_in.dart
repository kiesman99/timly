import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tyme/bloc/burn_in/burn_in_bloc.dart';
import 'package:tyme/bloc/burn_in/burn_in_event.dart';
import 'package:tyme/bloc/timer/timer_bloc.dart';
import 'package:tyme/bloc/timer/timer_event.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/model/exercise.dart';
import 'package:tyme/widgets/timer_detail_burn_in.dart';

@immutable
class TimerPageBurnIn extends StatelessWidget {
  const TimerPageBurnIn(
      {this.leftPadding = 0.0,
      this.topPadding = 0.0,
      @required this.timerState});

  final double leftPadding;
  final double topPadding;
  final TimerState timerState;

  Widget _bodyWidget(BuildContext pageContext) {
    var interval = pageContext.select((Exercise e) => e.interval);
    var intervalPercentage =
        (timerState.remaining.interval.inSeconds / interval.inSeconds) * 100.0;

    return timerState.maybeWhen(
        finished: (_) => _textWidget(t.timer.finish),
        paused: (_, __) => _textWidget(t.timer.pause),
        orElse: () {
          return Center(
            child: TimerDetailBurnIn(
              intervalPercentage: intervalPercentage,
              topPadding: topPadding,
              leftPadding: leftPadding,
              timerState: timerState,
            ),
          );
        });
  }

  Widget _textWidget(String text) {
    return Padding(
        padding: EdgeInsets.only(left: leftPadding, top: topPadding),
        child: Center(
          child: Text(t.timer.pause,
              style: const TextStyle(fontSize: 30.0, color: Colors.white)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          context.bloc<TimerBloc>().add(const TimerEvent.pause());
          context.bloc<BurnInBloc>().add(const BurnInEvent.touched());
        },
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(color: Colors.black),
              child: _bodyWidget(context),
            );
          },
        ),
      ),
    );
  }
}
