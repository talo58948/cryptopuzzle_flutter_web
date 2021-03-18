import 'package:flutter/cupertino.dart';
import 'package:web1/constants.dart';

import 'models/piece.dart';
import 'constants.dart';
import 'models/puzzle.dart';

enum Pages {
  about,
  featured,
}
// const Map<Pages, Route> routes;

class Manager {
  static Function onPressOnPiece(Piece piece) {
    return () {};
    //remember to do Hero animation with the piece
  }

  static int getMaxPuzzlesInRow(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    //maybe listen for changes??
    return (_width / kAvgWidthOfPuzzle).floor();
  }

  static double getSizeOfSinglePuzzle(
      BuildContext context, int maxPuzzlesInRow) {
    double _width = MediaQuery.of(context).size.width / maxPuzzlesInRow;
    if (_width > kPuzzleCabinetWidthMax) {
      _width = kPuzzleCabinetWidthMax;
    } else if (_width < kPuzzleCabinetWidthMin) {
      _width = kPuzzleCabinetWidthMin;
    }
    return _width;
  }

  static List<Puzzle> getDisplayPuzzles() {
    List<Puzzle> li = [];
    for (int i = 0; i < 14; i++) {
      li.add(Puzzle.dflt);
      li.add(Puzzle.dflt2);
    }
    return li;
  }

  static void moveTo() {}
  static void onPressedOnFAB() {}
}
