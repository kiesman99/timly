import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tyme/bloc/timer/timer_state.dart';
import 'package:tyme/hooks/fade_scale_animation.dart';
import 'package:tyme/i18n/strings.g.dart';

class SetupDetail extends HookWidget {
  const SetupDetail({
    @required this.setupState,
  });

  final Setup setupState;

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController =
        useAnimationController(duration: const Duration(milliseconds: 300));
    final Animation<double> fadeScaleAnimation =
        useFadeScaleAnimation(animationController);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              t.timer.starting_in,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 30.0),
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
