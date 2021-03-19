import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_container.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/puzzle.dart';

class PuzzleCabinet extends StatelessWidget {
  final Puzzle puzzle;
  PuzzleCabinet({@required this.puzzle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          puzzle.id,
          style: kPuzzleTitleStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: kPuzzleWidth,
          height: kPuzzleWidth * puzzle.ratio,
          child: PuzzleContainer(
            puzzle: puzzle,
          ),
        ),
      ],
    );
  }
}
