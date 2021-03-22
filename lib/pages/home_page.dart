import 'package:flutter/material.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/constants.dart';
import 'package:web1/pages/custom_page.dart';

import '../manager.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: AssetImage('images/puzzle1cover.png')),
      // ),
      page: Pages.home,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'PuzzleTokens',
                    textAlign: TextAlign.left,
                    style: kRealTitleStyle.copyWith(
                      fontSize: 150.0,
                      fontFamily: 'Open',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'The world’s first NFT puzzle,\nhosted on the Ethereum blockchain.\n',
                    textAlign: TextAlign.left,
                    style: kNavbarTitlesStyle.copyWith(fontSize: 40.0),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '''Every piece you buy is unique and yours to keep or sell forever.\n
Buy puzzle pieces, and complete puzzles with the world!
''',
            textAlign: TextAlign.left,
            style: kNavbarTitlesStyle,
          ),
        ],
      ),
    );
  }
}
