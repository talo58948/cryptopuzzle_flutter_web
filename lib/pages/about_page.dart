import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/constants.dart';
import '../manager.dart';
import 'custom_page.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about'; //route name of page

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      page: Pages.about,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContentContainer(
            children: [
              // AnimatedText(
              //   'WE ARE PUZZLES YOU ARE PUZZLE BUYER',
              //   style: kTitleStyle,
              //   textAlign: TextAlign.center,
              Text(
                'WE ARE PUZZLES YOU ARE PUZZLE BUYER',
                style: kTitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 70,
              ),
              Container(),
            ],
          ),
          Image(
            image: AssetImage('images/puzzle1cover.png'),
            fit: BoxFit.fill,
          ),
          ContentContainer(
            children: [
              Text(
                'WE ARE PUZZLES YOU ARE PUZZLE BUYER',
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
              SizedBox(
                height: 70,
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
