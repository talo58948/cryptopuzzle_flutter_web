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
import 'pages/home_page.dart';

//enum for all the pages for easy access,
//some functions use it to detect which page is being proccessed
enum Pages {
  home,
  puzzles,
  about,
  piece,
  loading,
}

/*
a map that given a Page of type Pages return the route name associated with it
*/
const Map<Pages, String> pageRouteMap = {
  Pages.home: HomePage.routeName,
  Pages.puzzles: FeaturedPuzzlesPage.routeName,
  Pages.about: AboutPage.routeName,
  Pages.piece: PiecePage.routeName,
  Pages.loading: LoadingPage.routeName,
};

//Manager holds key static functions that gives the site functionality
class Manager {
  //a functions that takes context of current widget tree and moves to featured puzzles screen, passes it args (puzzles)
  static void moveToFeatured(BuildContext context) {
    Navigator.pushNamed(
      context,
      FeaturedPuzzlesPage.routeName,
      arguments: FeaturedPuzzlesPageArgs(Manager.getDisplayPuzzles()),
    );
  }

  //when pressed on a given piece it redirects to the piece page with all of its attributes
  static Function onPressOnPiece(Piece piece) {
    return (context) => moveTo(
          Pages.piece,
          context,
          args: PiecePageArgs(piece),
          from: Pages.puzzles,
        );
    //remember to do Hero animation with the piece
  }

  //a function that gets the max puzzles allowed on a single row in the featured puzzles grid
  static int getMaxPuzzlesInRow(BoxConstraints constraints) {
    double _width = constraints.widthConstraints().maxWidth;
    return (_width / kPuzzleContainerWidth).floor();
  }

  //a function that gets the default puzzles, for TESTING
  static Future<List<Puzzle>> getDfltPuzzles() {
    return Future.delayed(Duration(milliseconds: 500), () {
      List<Puzzle> puzzles = [];
      for (int i = 0; i < 20; i++) {
        puzzles.add(Puzzle.dflt);
      }
      return puzzles;
    });
  }

  //gets all display puzzles from Networker
  static Future<List<Puzzle>> getDisplayPuzzles() {
    Networker net = Networker();
    return net.getAllPuzzles();
  }

  //keeps track of all previos routes visited
  static Stack<Pages> _prevRoutes = new Stack<Pages>();

  //makes sure to be up to date any time the Navigator pushes a route or pops
  static void onNavPop() => _prevRoutes.pop();
  static void onNavPush(Pages page) => _prevRoutes.push(page);

  //moves to a given page, if already been to page it pops until it finds it, else pushes it on top with arguments if needed
  static void moveTo(
    Pages to, //the desired page to move to
    BuildContext context, {
    //the context of the widget tree
    Pages
        from, // the page to move from {optional, might move from nothing like when initiallizing}
    dynamic args, //the arguments that might get passed, {optional}
  }) {
    //in case it tries to move to the already visible page it does nothing, as expected
    if (to == from) {
      return;
    }
    //if there are previous routes, and they contain the desired route that got requested to move to, pop until
    if (_prevRoutes.isNotEmpty) {
      if (_prevRoutes.contains(to)) {
        Navigator.popUntil(context, (route) {
          return route.settings.name == pageRouteMap[to];
        });
        return;
      }
    }

    //in case previous routes do not contain the desired route we need to get to,
    //a simple switch statement that pushes the desired route
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

  static void moveToHomeAndReplace(Pages from, BuildContext context) {
    if (from == Pages.home) {
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  //when pressed on floating action button, this is what happens: {currently inactive because of no floating action button}
  static void onPressedOnFAB() {}

  //a debuging tool that prints the entire stack
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
