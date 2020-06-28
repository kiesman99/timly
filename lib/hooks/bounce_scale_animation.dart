import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// This function will provide an animation from 0.0 to 1.0
/// with an [Curves.easeInOutQuint]
Animation useBounceScaleAnimation(AnimationController controller) {
  return Hook.use(_BounceScaleHook(animationController: controller));
}

class _BounceScaleHook extends Hook<Animation> {
  final AnimationController animationController;

  _BounceScaleHook({@required this.animationController});

  @override
  _BounceScaleHookState createState() => _BounceScaleHookState();
}

class _BounceScaleHookState extends HookState<Animation, _BounceScaleHook> {
  Animation _bounceScaleAnimation;

  @override
  void initHook() {
    _bounceScaleAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOutQuint))
        .animate(hook.animationController);
    super.initHook();
    hook.animationController.forward(from: 0.0);
  }

  @override
  Animation build(BuildContext context) => _bounceScaleAnimation;
}
