import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web1/constants.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            footerContent,
            style: kFooterTextStyle,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     // Text('Icons made by '),
          //     // GestureDetector(
          //     //   onTap: () {
          //     //     _launchURL('https://www.freepik.com');
          //     //   },
          //     // ),
          //     Text(
          //       'Icons made by ',
          //       style: kFooterTextStyle,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         _launchURL('https://www.freepik.com');
          //       },
          //       child: Text(
          //         'Freepik',
          //         style: kFooterTextStyle,
          //       ),
          //     ),
          //     Text(
          //       ' from ',
          //       style: kFooterTextStyle,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         _launchURL('https://www.flaticon.com/');
          //       },
          //       child: Text(
          //         'www.flaticon.com',
          //         style: kFooterTextStyle,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

const footerContent =
    '''Copyright © 2021 SteelWorks Entertainment All rights reserved.''';
const appriciations =
    '''<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>''';

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
