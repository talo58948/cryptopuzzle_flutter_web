import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/puzzle_grid_widget.dart';
import 'package:web1/constants.dart';
import 'package:web1/models/puzzle.dart';
import 'package:web1/pages/loading_page.dart';
import '../manager.dart';
import 'custom_page.dart';
import 'home_page.dart';
import 'loading_page.dart';

//puzzle page expects args of this type, that is future List of puzzles
class FeaturedPuzzlesPageArgs {
  final Future<List<Puzzle>> futurePuzzles;
  FeaturedPuzzlesPageArgs(this.futurePuzzles);
}

class FeaturedPuzzlesPage extends StatelessWidget {
  static const routeName = '/featured-puzzles';
  FeaturedPuzzlesPage();
  @override
  Widget build(BuildContext context) {
    final FeaturedPuzzlesPageArgs args =
        ModalRoute.of(context).settings.arguments;
    var futurePuzzles = args != null ? args.futurePuzzles : null;
    return futurePuzzles == null
        ? HomePage()
        : FutureBuilder(
            future: futurePuzzles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return _OofWidget();
                }
                if (snapshot.data == 'null') {
                  return HomePage();
                }
                return CustomPage(
                  page: Pages.puzzles,
                  child: Center(
                    child: SingleChildScrollView(
                      child: ContentContainer(
                        // height: 6000,
                        // width: 2000,
                        children: [
                          PuzzleGridWidget(
                            puzzles: snapshot.data,
                          ),
                          SizedBox(height: 75.0),
                          _MoreComingSoon(),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return LoadingPage();
              }
            });
  }
}

class _OofWidget extends StatelessWidget {
  const _OofWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Oof'),
          SizedBox(
            height: 50.0,
          ),
          Text('Something Went Wrong'),
        ],
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
