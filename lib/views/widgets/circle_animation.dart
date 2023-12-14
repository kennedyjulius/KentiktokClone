import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  final Widget child;
  const CircleAnimation({super.key, 
  required this.child
  });

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
//declaring an init state for the controller
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    controller.forward();
    controller.repeat();
  }

//dispose controller above
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.1, end: 1.1).
      animate(controller),
      child: widget.child,
    );
  }
}
