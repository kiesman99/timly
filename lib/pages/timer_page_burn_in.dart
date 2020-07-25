import 'package:easy_localization/easy_localization.dart';
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

class TimerPageBurnIn extends StatelessWidget {
  final double leftPadding;
  final double topPadding;
  final TimerState timerState;

  TimerPageBurnIn({this.leftPadding = 0.0,
    this.topPadding = 0.0,
    @required this.timerState});

  Widget _bodyWidget(BuildContext pageContext) {
    var interval = pageContext.select((Exercise e) => e.interval);
    var intervalPercentage =
        (timerState.remaining.interval.inSeconds / interval.inSeconds) * 100.0;

    return timerState.maybeWhen(
        finished: (_) => _textWidget('timer.finish'.tr()),
        paused: (_, __) => _textWidget('timer.pause'.tr()),
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
          child: Text('timer.pause',
                  style: TextStyle(fontSize: 30.0, color: Colors.white))
              .tr(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          context.bloc<TimerBloc>().add(TimerEvent.pause());
          context.bloc<BurnInBloc>().add(BurnInEvent.touched());
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(color: Colors.black),
              child: _bodyWidget(context),
            );
          },
        ),
      ),
    );
  }
}
