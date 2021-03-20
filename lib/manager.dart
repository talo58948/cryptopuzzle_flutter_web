import 'package:flutter/material.dart' hide Stack;
import 'package:web1/constants.dart';
import 'package:stack/stack.dart';
import 'package:web1/pages/piece_page.dart';
import 'models/piece.dart';
import 'constants.dart';
import 'models/puzzle.dart';
import 'networker.dart';

enum Pages {
  about,
  featured,
}
// const Map<Pages, Route> routes;

class Manager {
  static Function onPressOnPiece(Piece piece) {
    return (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PiecePage(piece: piece),
        ),
      );
    };
    //remember to do Hero animation with the piece
  }

  static int getMaxPuzzlesInRow(BoxConstraints constraints) {
    double _width = constraints.widthConstraints().maxWidth;
    print(_width);
    print('manager ${(_width / kPuzzleContainerWidth).floor()}');
    //maybe listen for changes??
    return (_width / kPuzzleContainerWidth).floor();
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
  static Future<List<Puzzle>> getDfltPuzzles() {
    return Future.delayed(Duration(milliseconds: 500), () {
      List<Puzzle> puzzles = [];
      for (int i = 0; i < 20; i++) {
        puzzles.add(Puzzle.dflt);
      }
      return puzzles;
    });
  }

  static Future<List<Puzzle>> getDisplayPuzzles() {
    Networker net = Networker();
    return net.getAllPuzzles();
  }

  static Stack<Pages> navStack = Stack<Pages>();
  static void moveTo(Pages to, Pages from, BuildContext context) {
    if (to == from) {
      return;
    }
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
