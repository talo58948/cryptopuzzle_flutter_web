import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/components/go_to_button.dart';
import 'package:web1/constants.dart';
import 'package:web1/external/my_flutter_app_icons.dart';
import 'package:web1/pages/custom_page.dart';

import '../manager.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      page: Pages.home,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 650,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/puzzle1cover.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 55.0),
                  Text(
                    'PuzzleTokens',
                    textAlign: TextAlign.left,
                    style: kRealTitleStyle.copyWith(
                      fontSize: 150.0,
                      fontFamily: 'Open',
                      fontWeight: FontWeight.normal,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'The world’s first NFT puzzle,\nhosted on the Ethereum blockchain.',
                    textAlign: TextAlign.left,
                    style: kNavbarTitlesStyle.copyWith(
                      fontSize: 45.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            '''Every piece you buy is unique and yours to keep or sell forever.\n
Buy puzzle pieces, and complete puzzles with the world!
''',
            textAlign: TextAlign.left,
            style: kNavbarTitlesStyle.copyWith(fontSize: 25.0),
          ),
          SizedBox(
            height: 50.0,
          ),
          _FooterButtons(),
        ],
      ),
    );
  }
}

class _FooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: GoToButton(
            text: 'OpenSea',
            color: Color(0xFF427DBD),
            image: AssetImage('images/opensea_logo.png'),
            url: 'https://opensea.io/collection/puzzletokens/',
          ),
        ),
        SizedBox(
          width: 25.0,
        ),
        Container(
          child: GoToButton(
            text: 'Twitter',
            color: Color(0xFF909090),
            icon: MyFlutterApp.twitter_bird_logo,
            url: 'https://twitter.com/PuzzleTokens',
          ),
        ),
      ],
    );
  }
}
