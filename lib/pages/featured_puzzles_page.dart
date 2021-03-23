import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/floating_widget.dart';
import 'package:web1/components/puzzle_grid_widget.dart';
import 'package:web1/constants.dart';
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
        if (args != null) {
          args.futurePuzzles.then(
            (puzzlesList) {
              setState(() {
                puzzles = puzzlesList;
                inAsync = false;
              });
            },
          ).catchError((e) {
            print('ERROR ON FEATURED');
          });
        } else {
          Manager.moveTo(Pages.home, context);
        }
      },
    );
    return inAsync
        ? LoadingPage()
        : CustomPage(
            page: Pages.puzzles,
            child: Center(
              child: SingleChildScrollView(
                child: ContentContainer(
                  // height: 6000,
                  // width: 2000,
                  children: [
                    PuzzleGridWidget(
                      puzzles: puzzles,
                    ),
                    SizedBox(height: 75.0),
                    _MoreComingSoon(),
                  ],
                ),
              ),
            ),
          );
  }
}

class _MoreComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'More puzzles coming soon...',
      style: kSemiTransparentPiecePageStyle,
    );
  }
}
