import 'package:flutter/material.dart';
import 'hoverable_widget.dart';

class FloatingWidget extends StatefulWidget {
  final Widget child;
  final double magnitude;
  FloatingWidget({this.magnitude = 20.0, this.child});
  @override
  _FloatingWidgetState createState() =>
      _FloatingWidgetState(magnitude: magnitude, child: child);
}

class _FloatingWidgetState extends State<FloatingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  final double magnitude;
  double y = 0.0;
  final Widget child;

  _FloatingWidgetState({@required this.magnitude, this.child});
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    animation.addListener(() {
      y = animation.value * magnitude;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      onHoverStart: () {
        controller.forward();
      },
      onHoverEnd: () {
        controller.reverse();
      },
      child: Transform.translate(
        offset: Offset(0, -y),
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
