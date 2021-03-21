import 'package:flutter/material.dart';
import 'package:web1/manager.dart';
import 'package:web1/pages/about_page.dart';
import 'package:web1/pages/loading_page.dart';
import 'pages/featured_puzzles_page.dart';
import 'tester/tester.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => AboutPage(),
        '/featured-puzzles': (context) => LoadingPage(
              future: Manager.getDisplayPuzzles(),
              then: (puzzles) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeaturedPuzzlesPage(
                    puzzles: puzzles,
                  ),
                ),
              ),
            ),
      },
    );
  }
}

Image image;
