import 'package:flutter/material.dart';
import 'package:web1/manager.dart';
import 'package:web1/pages/about_page.dart';
import 'package:web1/pages/home_page.dart';
import 'package:web1/pages/loading_page.dart';
import 'package:web1/pages/piece_page.dart';
import 'pages/featured_puzzles_page.dart';
import 'tester/tester.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('test');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FeaturedPuzzlesPage.routeName: (context) => LoadingPage(
              future: Manager.getDisplayPuzzles(),
              then: (puzzles) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FeaturedPuzzlesPage(
                    puzzles: puzzles,
                  ),
                ),
              ),
            ),
        AboutPage.routeName: (context) => AboutPage(),
        PiecePage.routeName: (context) => PiecePage()
      },
    );
  }
}

Image image;
