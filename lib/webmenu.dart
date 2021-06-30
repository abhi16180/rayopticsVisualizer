import 'package:flutter/material.dart';
import 'package:rayoptics/customDialogueScreen.dart';

bool istrue = false;

class Web_menu extends StatefulWidget {
  final text;

  Web_menu({this.text});

  @override
  _Web_menuState createState() => _Web_menuState();
}

class _Web_menuState extends State<Web_menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 30,
      child: InkWell(
        onTap: () => widget.text == "About"
            ? showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialogue();
                })
            : showLicensePage(
                context: context,
                applicationName: 'Ray Optics visualizer',
              ),
        onHover: (value) {
          setState(() {
            istrue = value;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: istrue ? 65 : 65,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Center(
                child: AnimatedDefaultTextStyle(
              child: Text(widget.text),
              style: TextStyle(
                fontSize: istrue ? 15 : 14,
                fontFamily: 'orkney',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              duration: Duration(milliseconds: 100),
            )),
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
          ),
        ),
      ),
    );
  }
}
