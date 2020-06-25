import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:timly/bloc/burn_in/burn_in_bloc.dart';
import 'package:timly/bloc/burn_in/burn_in_event.dart';
import 'package:timly/bloc/timer/timer_bloc.dart';
import 'package:timly/bloc/timer/timer_event.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/model/exercise.dart';
import 'package:timly/widgets/timer_detail_burn_in.dart';

class TimerPageBurnIn extends StatelessWidget {
  final double leftPadding;
  final double topPadding;

  TimerPageBurnIn({this.leftPadding = 0.0, this.topPadding = 0.0});

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
              child: BlocBuilder<TimerBloc, TimerState>(
                builder: (context, state) {
                  var lapPercentage =
                      (context.watch<Exercise>().laps / state.remaining.laps) *
                          100.0;
                  return state.when(setup: (setup, remaining) {
                    return Center(
                      child: TimerDetailBurnIn(
                        lapPercentage: lapPercentage,
                        duration: setup,
                        laps: remaining.laps,
                        topPadding: topPadding,
                        leftPadding: leftPadding,
                      ),
                    );
                  }, running: (remaining) {
                    return Center(
                      child: TimerDetailBurnIn(
                        lapPercentage: lapPercentage,
                        duration: remaining.interval,
                        laps: remaining.laps,
                        topPadding: topPadding,
                        leftPadding: leftPadding,
                      ),
                    );
                  },
                      recover: (remaining) {
                        return Center(
                          child: TimerDetailBurnIn.recover(
                            lapPercentage: lapPercentage,
                            duration: remaining.recover,
                            laps: remaining.laps,
                            topPadding: topPadding,
                            leftPadding: leftPadding,
                          ),
                        );
                      },
                      paused: (_, __) {
                        return Padding(
                            padding:
                            EdgeInsets.only(left: leftPadding, top: topPadding),
                            child: Center(
                              child: Text('Pause',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.white)),
                            ));
                      },
                      finished: (_) {
                        return Padding(
                          padding:
                          EdgeInsets.only(left: leftPadding, top: topPadding),
                          child: Center(
                            child: Text('Finished',
                                style:
                                TextStyle(fontSize: 30.0, color: Colors.white)),
                          ),
                        );
                      });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
