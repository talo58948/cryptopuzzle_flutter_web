import 'package:flutter/material.dart' hide Navigator;
import 'package:web1/constants.dart';
import 'package:web1/manager.dart';
import 'package:web1/external/extensions.dart';

class Navbar extends StatelessWidget {
  final Pages page;
  Navbar({@required this.page});
  @override
  Widget build(BuildContext context) {
    Widget buildBar() {
      List<Widget> titles = [];
      Pages.values.forEach((element) {
        if (element != Pages.piece &&
            element != Pages.loading &&
            element != Pages.about) {
          titles.add(
            // ignore: deprecated_member_use
            FlatButton(
              splashColor: Colors.grey[900],
              onPressed: () => Manager.moveTo(element, context, from: page),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 22.5,
                ),
                child: element == Pages.home
                    ? Text(
                        'PuzzleTokens',
                        style: kNavbarTitlesStyle.copyWith(
                          fontFamily: 'Coda',
                          height: 1.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        element
                            .toString()
                            .toLowerCase()
                            .replaceAll('pages.', '')
                            .capitalize(),
                        style: kNavbarTitlesStyle,
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          );
          titles.add(
            VerticalDivider(
              thickness: 10.0,
              color: Colors.white,
            ),
          );
        }
      });
      try {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: titles,
        );
      } catch (e) {
        print(e);
        return Text('Error');
      }
    }

    return Container(
      color: kNavColor,
      child: Center(
        child: buildBar(),
      ),
    );
  }
}
