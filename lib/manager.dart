import 'package:flutter/material.dart' hide Stack;
import 'package:web1/constants.dart';
import 'package:stack/stack.dart';
import 'package:web1/pages/about_page.dart';
import 'package:web1/pages/featured_puzzles_page.dart';
import 'package:web1/pages/home_page.dart';
import 'package:web1/pages/loading_page.dart';
import 'package:web1/pages/piece_page.dart';
import 'models/piece.dart';
import 'constants.dart';
import 'models/puzzle.dart';
import 'networker.dart';

enum Pages {
  home,
  puzzles,
  about,
  piece,
  loading,
}
const Map<Pages, String> pageRouteMap = {
  Pages.home: HomePage.routeName,
  Pages.puzzles: FeaturedPuzzlesPage.routeName,
  Pages.about: AboutPage.routeName,
  Pages.piece: PiecePage.routeName,
  Pages.loading: LoadingPage.routeName,
};

class Manager {
  static void moveToFeatured(BuildContext context) {
    Navigator.pushNamed(
      context,
      FeaturedPuzzlesPage.routeName,
      arguments: FeaturedPuzzlesPageArgs(Manager.getDisplayPuzzles()),
    );
  }

  static Function onPressOnPiece(Piece piece) {
    return (context) => moveTo(
          Pages.piece,
          context,
          args: PiecePageArgs(piece),
          from: Pages.puzzles,
        );
    //remember to do Hero animation with the piece
  }

  static int getMaxPuzzlesInRow(BoxConstraints constraints) {
    double _width = constraints.widthConstraints().maxWidth;
    //maybe listen for changes??
    return (_width / kPuzzleContainerWidth).floor();
  }

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

  static Stack<Pages> _prevRoutes = new Stack<Pages>();
  static void moveTo(
    Pages to,
    BuildContext context, {
    Pages from,
    dynamic args,
  }) {
    if (to == from) {
      return;
    }
    if (_prevRoutes.isNotEmpty) {
      if (_prevRoutes.contains(to)) {
        Navigator.popUntil(context, (route) {
          return route.settings.name == pageRouteMap[to];
        });
        return;
      }
    }
    switch (to) {
      case Pages.home:
        Navigator.pushNamed(context, HomePage.routeName);
        break;
      case Pages.about:
        Navigator.pushNamed(context, AboutPage.routeName);
        break;
      case Pages.puzzles:
        Manager.moveToFeatured(context);
        break;
      case Pages.piece:
        Navigator.pushNamed(context, PiecePage.routeName, arguments: args);
        break;
      default:
    }
  }

  static void onNavPop() => _prevRoutes.pop();

  static void onNavPush(Pages page) => _prevRoutes.push(page);

  static void onPressedOnFAB() {}
  // ignore: unused_element
  static void _printAllStack(Stack stack) {
    Stack temp = Stack();
    int count = 0;
    while (stack.isNotEmpty) {
      print('$count: ${stack.top()}');
      temp.push(stack.pop());
      count++;
    }
    print('\n');
    while (temp.isNotEmpty) {
      stack.push(temp.pop());
    }
  }
}
