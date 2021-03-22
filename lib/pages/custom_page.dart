import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:web1/components/footer_widget.dart';
import 'package:web1/constants.dart';
import '../manager.dart';
import 'package:web1/components/navbar.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  final bool showFooter;
  final Pages page;
  final bool showNavbar;
  CustomPage(
      {@required this.child,
      this.showFooter = true,
      @required this.page,
      this.showNavbar = true});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kAccentColor,
      //   splashColor: kSecondaryAccentColor,
      //   onPressed: () => Manager.onPressedOnFAB(),
      //   child: Icon(Icons.message),
      // ),
      body: Column(
        children: [
          showNavbar
              ? Navbar(
                  page: page,
                )
              : SizedBox(
                  height: 0.0,
                ),
          Expanded(
            child: !showFooter
                ? SingleChildScrollView(
                    child: child,
                  )
                : FooterView(
                    children: [
                      SingleChildScrollView(
                        child: child,
                      ),
                    ],
                    footer: Footer(
                      child: FooterWidget(),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
