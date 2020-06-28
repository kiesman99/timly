import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timly/bloc/timer/timer_state.dart';
import 'package:timly/hooks/fade_scale_animation.dart';

class SetupDetail extends HookWidget {
  final Setup setupState;

  SetupDetail({
    @required this.setupState,
  });

  @override
  Widget build(BuildContext context) {
    final animationController =
    useAnimationController(duration: const Duration(milliseconds: 300));
    final Animation fadeScaleAnimation =
    useFadeScaleAnimation(animationController);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'timer.starting_in',
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            SizedBox(height: 30.0),
            ScaleTransition(
              scale: fadeScaleAnimation,
              child: FadeTransition(
                opacity: fadeScaleAnimation,
                child: Text(
                  setupState.setupDuration.inSeconds.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
          ],
        ));
  }
}
