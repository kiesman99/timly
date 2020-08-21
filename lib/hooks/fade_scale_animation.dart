import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// This function will provide an animation from 0.0 to 1.0
/// it should be used in combination with [ScaleTransition]
/// and a [FadeTransition] to make the widget scale and fade in
/// at the same time.
Animation<double> useFadeScaleAnimation(
    AnimationController animationController) {
  return Hook.use(
      _FadeScaleAnimationHook(animationController: animationController));
}

class _FadeScaleAnimationHook extends Hook<Animation<double>> {
  const _FadeScaleAnimationHook({@required this.animationController});

  final AnimationController animationController;

  @override
  _FadeScaleAnimationState createState() => _FadeScaleAnimationState();
}

class _FadeScaleAnimationState
    extends HookState<Animation<double>, _FadeScaleAnimationHook> {
  Animation<double> _animation;

  @override
  void initHook() {
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(hook.animationController);
    super.initHook();
    hook.animationController.forward(from: 0.0);
  }

  @override
  void didUpdateHook(_FadeScaleAnimationHook oldHook) {
    hook.animationController.forward(from: 0.0);
    super.didUpdateHook(oldHook);
  }

  @override
  Animation<double> build(BuildContext context) {
    return _animation;
  }
}
