import 'package:flutter/cupertino.dart' hide Stack;
import 'package:web1/constants.dart';
import 'package:stack/stack.dart';
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

  static int getMaxPuzzlesInRow(BoxConstraints constraints) {
    double _width = constraints.widthConstraints().maxWidth;
    //maybe listen for changes??
    return (_width / kPuzzleCabinetWidthMin).floor();
  }

  // static double getSizeOfSinglePuzzle(
  //     BuildContext context, int maxPuzzlesInRow) {
  //   double _width = MediaQuery.of(context).size.width / maxPuzzlesInRow;
  //   if (_width > kPuzzleCabinetWidthMax) {
  //     _width = kPuzzleCabinetWidthMax;
  //   } else if (_width < kPuzzleCabinetWidthMin) {
  //     _width = kPuzzleCabinetWidthMin;
  //   }
  //   return _width;
  // }

  static List<Puzzle> getDisplayPuzzles() {
    List<Puzzle> li = [];
    for (int i = 0; i < 14; i++) {
      li.add(Puzzle.dflt);
      li.add(Puzzle.dflt2);
    }
    return li;
  }

  static Stack<Pages> navStack = Stack<Pages>();
  static void moveTo(Pages to, Pages from, BuildContext context) {
    if (navStack.isNotEmpty && navStack.top() == to) {
      navStack.pop();
      Navigator.pop(context);
    } else {
      switch (to) {
        case Pages.featured:
          Navigator.pushNamed(context, '/featured-puzzles');
          break;
        case Pages.about:
          Navigator.pushNamed(context, '/');
          break;
      }
      navStack.push(from);
    }
  }

  static void onPressedOnFAB() {}
}
