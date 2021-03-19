import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_cabinet.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/manager.dart';

class PuzzleGridWidget extends StatelessWidget {
  final List<Puzzle> puzzles = Manager.getDisplayPuzzles();

  Container buildGrid(BoxConstraints constraints) {
    List<Widget> columnChildren = [];
    int numInRow = Manager.getMaxPuzzlesInRow(constraints);

    for (int i = 0;
        i < puzzles.length - puzzles.length % numInRow;
        i += numInRow) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < numInRow; j++) {
        rowChildren.add(
          Expanded(
            child: PuzzleCabinet(
              puzzle: puzzles[i + j],
            ),
          ),
        );
      }
      columnChildren.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
    }
    return Container(
      height: columnChildren.length * kPuzzleCaninetHeightMin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: columnChildren,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => buildGrid(constraints),
    );
  }
}
