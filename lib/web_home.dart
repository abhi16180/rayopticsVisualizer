import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rayoptics/webmenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Web_home extends StatefulWidget {
  Web_home({Key? key}) : super(key: key);

  @override
  _Web_homeState createState() => _Web_homeState();
}

bool istrue = false;

class _Web_homeState extends State<Web_home> {
  @override
  Widget build(BuildContext context) {
    double swidth = (MediaQuery.of(context).size.width);
    double sheight = (MediaQuery.of(context).size.height);
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: sheight,
            child: Stack(
              children: [
                Container(
                  width: swidth,
                  height: sheight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      HexColor('#00dc9e'),
                      HexColor('#0085fe'),
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                  ),
                ),
                Container(
                  width: swidth,
                  height: sheight / 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        child: RichText(
                          text: TextSpan(
                            text: '    Ray optics',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'aileron',
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '\n                               visualizer',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: swidth / 8,
                        child: Web_menu(
                          text: 'Licenses',
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: swidth / 28,
                        child: Web_menu(
                          text: 'About',
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: sheight / 3,
                  left: swidth / 5,
                  child: Container(
                    margin: EdgeInsets.only(right: swidth / 5),
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome,\n',
                        style: TextStyle(
                          fontFamily: 'orkney',
                          color: Colors.white,
                          fontSize: swidth / 16,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Learn ray optics with visualizer\nClick the below button to get started',
                            style: TextStyle(
                              fontSize: swidth / 48,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 120),
                    width: istrue ? 155 : 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: HexColor('fffe7b'),
                    ),
                    margin: EdgeInsets.only(top: sheight / 3),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'lensOptions');
                      },
                      onHover: (value) {
                        setState(() {
                          istrue = value;
                        });
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedDefaultTextStyle(
                            child: Center(
                              child: Text(
                                "Choose Lens\n",
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'orkney',
                              fontSize: istrue ? 18 : 16,
                            ),
                            duration: Duration(milliseconds: 120),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Center(
                      child: Container(
                          width: 200,
                          margin: EdgeInsets.only(top: sheight / 1.4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () => _urlLauncher(
                                    'https://github.com/abhi16180'),
                                icon: FaIcon(
                                  FontAwesomeIcons.github,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () => _urlLauncher(
                                    'https://twitter.com/AbhilashHegde9'),
                                icon: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () => _urlLauncher(
                                    'https://instagram.com/abhilash__hegde?utm_medium=copy_link'),
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//launch url
void _urlLauncher(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
