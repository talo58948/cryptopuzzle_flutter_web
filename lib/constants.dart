import 'package:flutter/material.dart';

//Contract Addresses
const kOpenSeaContractAddress = '0x495f947276749Ce646f68AC8c248420045cb7b5e';
const kContractAddress = '0x655Ca549CfCEc6f3f8f224F7285fc05cf6c5eD1d';
const kNullAddress = '0x0000000000000000000000000000000000000000';
//0x655Ca549CfCEc6f3f8f224F7285fc05cf6c5eD1d

//set links
const kTwitterLink = 'https://twitter.com/PuzzleTokens';
const kOpenSeaLink = 'https://opensea.io/collection/puzzletokens';

//set sizes
const kPuzzleContainerWidth = 400.0;
const kPuzzleWidth = 350.0;
const kWidthOfContentContainer = 1000.0;
const kFocusedPieceWidth = 600.0;
const kGoToButtonHeight = 50.0;
const kStarSize = 40.0;

//color scheme
const kBackgroundColor = Color(0xFF181818);
const kNavColor = Colors.black;
const kSecondaryColor = Colors.white;
const kAccentColor = Colors.red;
const kSecondaryAccentColor = Colors.redAccent;

//text style and themes
const kPuzzleTitleStyle = TextStyle(
  fontFamily: 'Open',
  fontSize: 24.0,
  color: kSecondaryColor,
);
const kTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 48.0,
  height: 1.6,
  fontFamily: 'Roboto',
  color: kSecondaryColor,
);
const kContentStyle = TextStyle(
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 18.0,
  height: 1.6,
  fontFamily: 'Roboto',
  color: kSecondaryColor,
);
const kNavbarTitlesStyle = TextStyle(
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 18.0,
  height: 1.0,
  fontFamily: 'Roboto',
  color: kSecondaryColor,
  textBaseline: TextBaseline.ideographic,
);
const kRealTitleStyle = TextStyle(
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 70.0,
  height: 1.6,
  fontWeight: FontWeight.bold,
  fontFamily: 'Coda',
  color: kSecondaryColor,
  textBaseline: TextBaseline.ideographic,
);
const kGoToButtonTextStyle = TextStyle(
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 18.0,
  fontFamily: 'Roboto',
  color: kBackgroundColor,
  textBaseline: TextBaseline.alphabetic,
);
const kPriceTextStyle = TextStyle(
  letterSpacing: 1.5,
  wordSpacing: 6.0,
  fontSize: 30.0,
  height: 1.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);
const kFooterTextStyle = TextStyle(
  color: kSecondaryColor,
);
const kSemiTransparentPiecePageStyle = TextStyle(
  letterSpacing: 2.5,
  wordSpacing: 6.0,
  fontSize: 18.0,
  height: 1.0,
  fontFamily: 'Roboto',
  color: Color(0xFFAEAEAE),
);
