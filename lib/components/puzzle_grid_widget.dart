import 'package:flutter/material.dart';
import 'package:web1/components/puzzle_cabinet.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/manager.dart';

class PuzzleGridWidget extends StatelessWidget {
  final List<Puzzle> puzzles;

  PuzzleGridWidget({@required this.puzzles});
  Widget buildGrid(BoxConstraints constraints) {
    try {
      List<Widget> columnChildren = [];
      int numInRow = Manager.getMaxPuzzlesInRow(constraints);
      numInRow = numInRow == 0 ? 1 : numInRow;
      print(numInRow);
      print('\n\n\n');
      // try {
      for (int i = 0;
          i < puzzles.length - puzzles.length % numInRow;
          i += numInRow) {
        List<Widget> rowChildren = [];
        print('$i\n');

        for (int j = 0; j < numInRow; j++) {
          print('$j\n');
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
      if (puzzles.length % numInRow != 0) {
        //if after all of the grid building, there are leftover puzzles, insert them
        List<Widget> rowChildren = [];
        for (int i = 0; i < puzzles.length % numInRow; i++) {
          rowChildren.add(
            PuzzleCabinet(
              puzzle:
                  puzzles[i + (numInRow * (puzzles.length / numInRow).floor())],
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
        print('h');
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      );
    } catch (e) {
      print('error in puzzle grid widget$e');
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
