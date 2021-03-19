// import 'package:flutter/material.dart';
// import 'package:web1/manager.dart';
// import 'package:web1/models/puzzle.dart';
// import 'package:web1/components/puzzle_cabinet.dart';

// class PuzzleGrid extends StatelessWidget {
//   final List<Puzzle> puzzles = Manager.getDisplayPuzzles();

//   Column buildGrid(
//       {int maxNumOfPuzzlesInRow,
//       double widthSinglePuzzle,
//       double heightSinglePuzzle}) {
//     int _displayablePuzzlesNum =
//         puzzles.length - (puzzles.length % maxNumOfPuzzlesInRow);
//     List<Widget> columnChildren = [];
//     for (int i = 0; i < _displayablePuzzlesNum; i += maxNumOfPuzzlesInRow) {
//       List<PuzzleCabinet> rowChildren = [];
//       for (int j = 0; j < maxNumOfPuzzlesInRow; j++) {
//         rowChildren.add(PuzzleCabinet(
//           puzzle: puzzles[i + j],
//           width: widthSinglePuzzle,
//           height: heightSinglePuzzle,
//         ));
//       }
//       columnChildren.add(Row(
//         children: rowChildren,
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//       ));
//       // columnChildren.add(SizedBox(
//       //   height: 100,
//       // ));
//     }
//     return Column(
//       children: columnChildren,
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     int _numOfPuzzlesInRow = Manager.getMaxPuzzlesInRow(context);
//     double _puzzleWidth =
//         Manager.getSizeOfSinglePuzzle(context, _numOfPuzzlesInRow);

//     return buildGrid(
//       maxNumOfPuzzlesInRow: _numOfPuzzlesInRow,
//       widthSinglePuzzle: _puzzleWidth,
//       heightSinglePuzzle: _puzzleWidth,
//     );
//   }
// }
