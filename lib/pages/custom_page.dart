import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:web1/components/footer_widget.dart';
import 'package:web1/constants.dart';
import 'package:web1/external/route_aware_widget.dart';
import '../manager.dart';
import 'package:web1/components/navbar.dart';

//custome page
class CustomPage extends StatelessWidget {
  final Widget child;
  final bool
      materialPage; //if isnt material page dont show navbar footer and other stuff
  final Pages page; //page matching Pages enum

  CustomPage({
    @required this.child,
    this.materialPage = true,
    @required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return materialPage
        ? RouteAwareWidget(
            page: page,
            child: _CustomPageContent(
                materialPage: materialPage, page: page, child: child),
          )
        : _CustomPageContent(
            materialPage: materialPage, page: page, child: child);
  }
}

class _CustomPageContent extends StatelessWidget {
  const _CustomPageContent({
    Key key,
    @required this.materialPage,
    @required this.page,
    @required this.child,
  }) : super(key: key);

  final bool materialPage;
  final Pages page;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // {CURRENTLY INACTIVE FLOATING ACTION BUTTON}
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kAccentColor,
      //   splashColor: kSecondaryAccentColor,
      //   onPressed: () => Manager.onPressedOnFAB(),
      //   child: Icon(Icons.message),
      // ),
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            materialPage
                ? Navbar(
                    page: page,
                  )
                : SizedBox(
                    height: 0.0,
                  ),
            Expanded(
              child: !materialPage
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
                        backgroundColor: kBackgroundColor,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
