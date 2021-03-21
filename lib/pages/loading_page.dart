import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web1/constants.dart';
import 'package:web1/pages/custom_page.dart';
import 'package:web1/pages/featured_puzzles_page.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/loading';
  final Future future;
  final Function then;
  LoadingPage({@required this.future, @required this.then});

  @override
  Widget build(BuildContext context) {
    future.then((values) => then(values));
    return CustomPage(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SpinKitWave(
            color: kSecondaryColor,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
