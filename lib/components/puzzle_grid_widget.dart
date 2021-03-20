import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_cabinet.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/manager.dart';

class PuzzleGridWidget extends StatelessWidget {
  final List<Puzzle> puzzles;

  PuzzleGridWidget({@required this.puzzles});
  Widget buildGrid(BoxConstraints constraints) {
    List<Widget> columnChildren = [];
    int numInRow = Manager.getMaxPuzzlesInRow(constraints);
    numInRow = numInRow == 0 ? 1 : numInRow;
    print(numInRow);

    try {
      for (int i = 0;
          i < puzzles.length - puzzles.length % numInRow;
          i += numInRow) {
        List<Widget> rowChildren = [];

        for (int j = 0; j < numInRow; j++) {
          rowChildren.add(
            PuzzleCabinet(
              puzzle: puzzles[i + j],
            ),
          );
        }

        columnChildren.add(
          Row(
            mainAxisAlignment: numInRow == 1
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: rowChildren,
          ),
        );

        //////////////////////// FOR THE GAP BETWEEN ROWS!!!
        columnChildren.add(
          SizedBox(
            height: 75.0,
          ),
        );
        ///////////////////////////////////////////////
      }
      if (!(puzzles.length - puzzles.length % numInRow == 0)) {
        //if after all of the grid building, there are leftover puzzles, insert them
        List<Widget> rowChildren = [];
        for (int i = 0; i < puzzles.length % numInRow; i++) {
          rowChildren.add(
            PuzzleCabinet(
              puzzle: puzzles[i + (puzzles.length - puzzles.length % numInRow)],
            ),
          );
        }
        columnChildren.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowChildren,
        ));
      } else {
        columnChildren.removeLast();
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      );
    } catch (e) {
      print(e);
      return Container(
        child: Text('Oof'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => buildGrid(constraints),
    );
  }
}
