import 'package:flutter/material.dart';
import 'package:web1/pages/custom_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: Text('home'),
    );
  }
}
