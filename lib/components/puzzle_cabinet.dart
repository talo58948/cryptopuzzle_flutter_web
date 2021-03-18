import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_widget.dart';
import 'package:web1/constants.dart';
import 'package:web1/manager.dart';
import 'package:web1/models/puzzle.dart';

class PuzzleCabinet extends StatelessWidget {
  final Puzzle puzzle;
  final double width;
  final double height;
  PuzzleCabinet(
      {@required this.puzzle, @required this.width, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Text(
            puzzle.id,
            style: kPuzzleTitleStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          PuzzleWidget(
            puzzle: puzzle,
          ),
        ],
      ),
    );
  }
}
