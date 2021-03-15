import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HoverableWidget extends StatelessWidget {
  final Function onHoverStart;
  final Function onHoverEnd;
  final Widget child;
  HoverableWidget({
    @required this.onHoverStart,
    @required this.onHoverEnd,
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onHoverStart();
      },
      onExit: (event) => {onHoverEnd()},
      child: child,
    );
  }
}
