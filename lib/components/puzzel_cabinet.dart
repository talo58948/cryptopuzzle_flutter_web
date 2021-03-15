import 'package:flutter/material.dart';
import 'hoverable_widget.dart';
import 'puzzle_widget.dart';

class PuzzelCabinet extends StatefulWidget {
  @override
  _PuzzelCabinetState createState() => _PuzzelCabinetState();
}

class _PuzzelCabinetState extends State<PuzzelCabinet> {
  Color color = Colors.red;
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      onHoverStart: () {
        print('enter');
        color = Colors.blue;
        setState(() {});
        hovered = true;
      },
      onHoverEnd: () {
        color = Colors.red;
        print('end');
        setState(() {});
        hovered = false;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: color,
        ),
        child: Transform.translate(
            offset: Offset(0, 50),
            child: Container(
              height: 200,
              width: 200,
            )),
      ),
    );
  }
}
