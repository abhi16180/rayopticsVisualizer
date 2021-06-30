import 'dart:async';

import 'package:flutter/material.dart';
import './web_home.dart';
import './app_home.dart';
import './rayDiagram/lensOptions.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      routes: {
        'home': (context) => Home(),
        'lensOptions': (context) => LensOption(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'productSans',
      ),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double swidth = (MediaQuery.of(context).size.width);
    return swidth >= 640 ? Web_home() : App_home();
  }
}
