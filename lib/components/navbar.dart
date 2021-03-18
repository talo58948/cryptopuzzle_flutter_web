import 'package:flutter/material.dart' hide Navigator;
import 'package:web1/constants.dart';
import 'package:web1/manager.dart';

class Navbar extends StatelessWidget {
  final Pages page;
  Navbar({this.page});
  @override
  Widget build(BuildContext context) {
    List<Widget> getChildren() {
      List<Widget> titles = [];
      Pages.values.forEach((element) {
        titles.add(
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Text(
              element.toString().toUpperCase(),
              style: kNavbarTitlesStyle,
            ),
          ),
        );
        titles.add(
          VerticalDivider(
            width: 20,
            thickness: 20.0,
            color: Colors.black,
          ),
        );
      });
      return titles;
    }

    return Container(
      color: Colors.black,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: getChildren(),
        ),
      ),
    );
  }
}
