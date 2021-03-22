import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/floating_widget.dart';
import 'package:web1/components/puzzle_grid_widget.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/pages/loading_page.dart';
import '../manager.dart';
import 'custom_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class FeaturedPuzzlesPageArgs {
  final Future<List<Puzzle>> futurePuzzles;
  FeaturedPuzzlesPageArgs(this.futurePuzzles);
}

class FeaturedPuzzlesPage extends StatefulWidget {
  static const routeName = '/featured-puzzles';
  FeaturedPuzzlesPage();

  @override
  _FeaturedPuzzlesPageState createState() => _FeaturedPuzzlesPageState();
}

class _FeaturedPuzzlesPageState extends State<FeaturedPuzzlesPage> {
  bool inAsync = true;
  FeaturedPuzzlesPageArgs args;
  List<Puzzle> puzzles = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        print('gg');
        print('args $args');
        if (args != null) {
          print('l');
          args.futurePuzzles.then(
            (puzzles) {
              print('p');
              puzzles = puzzles;
              print('puzzles ${puzzles.length}');
              inAsync = false;
              setState(() {});
            },
          ).catchError((e) {
            print('ERROR ON FEATURED');
          });
        } else {}
      },
    );
    return inAsync
        ? LoadingPage()
        : CustomPage(
            page: Pages.featured,
            child: Center(
              child: SingleChildScrollView(
                child: ContentContainer(
                  // height: 6000,
                  // width: 2000,
                  children: [
                    PuzzleGridWidget(
                      puzzles: puzzles,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class ShitExperiment extends StatelessWidget {
  const ShitExperiment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ShitRow(),
        ),
        Expanded(
          child: ShitRow(),
        ),
        Expanded(
          child: ShitRow(),
        ),
      ],
    );
  }
}

class ShitRow extends StatelessWidget {
  const ShitRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
        Expanded(
          child: FloatingWidget(
            magnitude: 50.0,
            child: Shit(),
          ),
        ),
      ],
    );
  }
}

class Shit extends StatelessWidget {
  const Shit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}

// class AnimCo extends StatefulWidget {
//   @override
//   _AnimCoState createState() => _AnimCoState();
// }

// class _AnimCoState extends State<AnimCo> {
//   Offset offset = Offset(0, 0);
//   bool hovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return HoverableWidget(
//       child: Transform.translate(offset: offset),
//     );
//   }
// }
