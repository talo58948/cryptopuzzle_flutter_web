import 'package:flutter/material.dart';
import 'package:web1/components/animated_text.dart';
import 'package:web1/components/content_container.dart';
import 'package:web1/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../manager.dart';
import 'custom_page.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';
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
              Container(
                child: Text(
                  kAboutContent,
                  style: kContentStyle,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage('images/punk-variety-2x.png'),
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
              Container(
                child: Text(
                  kAboutContent,
                  style: kContentStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

const String kAboutContent =
    "I think what I'm seeing here is an identical epistemology to religion transferring itself ideologically in the political realm, but with serious consequences. There seems to be a cognitive intermediation zone between religious & ideological commitment, with ideological adherence to the dogmas injected by media & our emotional interpretations. The ideological replacement to religious belief is grounded in virtually no empirical data & facts and is driving our civilization to the ground, insofar as we engage in it. Religious belief in spite of of its faults, guides human consciousness and assists in ethical decision making, placing the individual sovereign above all his/hers responsibilities to the burden of life. It's replacement - dogmatic Ideological adherence, embodies a set of doctrines taking that responsibility off of the individual and placing the blame onto others. As a means of tactical persuasion, it uses misleading & factually baseless information. It installs methodical trip wires into the brains of politically susceptible teenagers.";
AppBar appBar;
