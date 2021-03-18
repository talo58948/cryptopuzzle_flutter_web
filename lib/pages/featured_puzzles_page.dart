import 'package:flutter/material.dart';
import 'package:web1/components/floating_widget.dart';
import 'package:web1/components/puzzle_grid.dart';
import 'custom_page.dart';

class FeaturedPuzzlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 6000,
            width: 2000,
            child: PuzzleGrid(),
          ),
        ),
      ),
    );
  }
}

class ShitExperiment extends StatelessWidget {
  const ShitExperiment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ShitRow(),
        ),
        Expanded(
          child: ShitRow(),
        ),
        Expanded(
          child: ShitRow(),
        ),
      ],
    );
  }
}

class ShitRow extends StatelessWidget {
  const ShitRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
      ],
    );
  }
}

class Shit extends StatelessWidget {
  const Shit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}

// class AnimCo extends StatefulWidget {
//   @override
//   _AnimCoState createState() => _AnimCoState();
// }

// class _AnimCoState extends State<AnimCo> {
//   Offset offset = Offset(0, 0);
//   bool hovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return HoverableWidget(
//       child: Transform.translate(offset: offset),
//     );
//   }
// }
