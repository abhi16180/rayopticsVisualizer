import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAlertDialogue extends StatefulWidget {
  CustomAlertDialogue({Key? key}) : super(key: key);

  @override
  _CustomAlertDialogueState createState() => _CustomAlertDialogueState();
}

class _CustomAlertDialogueState extends State<CustomAlertDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          'About',
          style: TextStyle(
              fontFamily: 'productSans',
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Developed by Abhilash Hegde',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'productSans',
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () => _urlLauncher('https://github.com/abhi16180'),
            icon: FaIcon(FontAwesomeIcons.github),
          ),
          IconButton(
            color: Colors.pink,
            onPressed: () => _urlLauncher(
                'https://instagram.com/abhilash__hegde?utm_medium=copy_link'),
            icon: FaIcon(FontAwesomeIcons.instagram),
          ),
          IconButton(
            color: Colors.blue,
            onPressed: () => _urlLauncher('https://twitter.com/AbhilashHegde9'),
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            color: HexColor('#00FF7F'),
            onPressed: () => Navigator.of(context).pop(),
            icon: FaIcon(FontAwesomeIcons.solidWindowClose),
          ),
        ])
      ],
    );
  }
}

void _urlLauncher(String url) async {
  await canLaunch(url) ? launch(url) : throw "Error";
}
