import 'package:flutter/material.dart';
import 'package:web1/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class GoToButton extends StatelessWidget {
  final String url;
  final String text;
  final Color color;
  final ImageProvider image;
  final IconData icon;
  GoToButton({
    this.url =
        'https://www.youtube.com/watch?v=sAXZbfLzJUg&ab_channel=sethandthecrew',
    @required this.text,
    @required this.color,
    this.image,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      width: 52.0 + 2.5 + text.length * (1.5 + 18.0) - 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? Container(
                      height: 32.0,
                      child: Image(
                        image: image,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Icon(
                      icon,
                      size: 20.0,
                    ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                text,
                style: kGoToButtonTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
