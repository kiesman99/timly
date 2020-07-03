import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavigationTransition extends HookWidget {
  final Widget child;

  BottomNavigationTransition({@required this.child});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final fadeAnimation =
        Tween(begin: 0.7, end: 1.0).animate(animationController);

    final scaleAnimation =
        Tween(begin: 0.95, end: 1.0).animate(animationController);

    animationController.forward(from: 0.0);

    return HookBuilder(
      builder: (context) {
        return Opacity(
          opacity: useAnimation(fadeAnimation),
          child: Transform.scale(
            scale: useAnimation(scaleAnimation),
            child: this.child,
          ),
        );
      },
    );
  }
}
