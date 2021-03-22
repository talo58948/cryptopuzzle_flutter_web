import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web1/constants.dart';
import 'package:web1/pages/custom_page.dart';
import 'package:web1/pages/featured_puzzles_page.dart';

import '../manager.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/loading';
  LoadingPage();

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      page: Pages.loading,
      showFooter: false,
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
