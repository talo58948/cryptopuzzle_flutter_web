import 'package:flutter/material.dart';
import 'package:web1/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class GoToButton extends StatelessWidget {
  final String url;
  final String text;
  final Color color;
  final IconData icon;
  GoToButton({@required this.url, this.text, @required this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _launchURL(url);
      },
      color: color,
      child: icon == null
          ? Text(
              text,
              style: kGoToButtonTextStyle,
            )
          : Row(
              children: [
                Icon(icon),
              ],
            ),
    );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
