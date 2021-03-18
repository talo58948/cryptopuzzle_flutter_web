import 'package:flutter/material.dart';
import 'package:web1/constants.dart';
import '../manager.dart';
import 'package:web1/components/navbar.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  CustomPage({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        onPressed: () => Manager.onPressedOnFAB(),
        child: Icon(Icons.message),
      ),
      body: Column(
        children: [
          Navbar(),
          Container(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
