import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_cabinet.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/manager.dart';

class PuzzleGridWidget extends StatelessWidget {
  final List<Puzzle> puzzles = Manager.getDisplayPuzzles();

  Column buildGrid(BuildContext context) {
    List<Widget> columnChildren = [];
    int numInRow = Manager.getMaxPuzzlesInRow(context);
    for (int i = 0; i < puzzles.length; i += numInRow) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < numInRow; j++) {
        rowChildren.add(
          PuzzleCabinet(
              puzzle: puzzles[i + j],
              width: kPuzzleCabinetWidthMax,
              height: kPuzzleCabinetWidthMax),
        );
      }
      columnChildren.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rowChildren,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGrid(context);
  }
}
