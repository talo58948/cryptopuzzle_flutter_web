import 'package:flutter/material.dart';
import 'package:web1/constants.dart';

class ContentContainer extends StatelessWidget {
  final List<Widget> children;
  ContentContainer({this.children});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
      child: Container(
        // width: MediaQuery.of(context).size.width / 1.75,
        width: kWidthOfContentContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
