import 'package:flutter/material.dart' hide Navigator;
import 'package:web1/constants.dart';
import 'package:web1/manager.dart';

class Navbar extends StatelessWidget {
  final Pages page;
  Navbar({this.page});
  @override
  Widget build(BuildContext context) {
    Widget buildBar() {
      List<Widget> titles = [];
      Pages.values.forEach((element) {
        titles.add(
          // ignore: deprecated_member_use
          FlatButton(
            splashColor: Colors.grey[900],
            onPressed: () => Manager.moveTo(element, page, context),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 22.5,
              ),
              child: Text(
                element.toString().toUpperCase().replaceAll('PAGES.', ''),
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
      color: kSecondaryColor,
      child: Center(
        child: buildBar(),
      ),
    );
  }
}
