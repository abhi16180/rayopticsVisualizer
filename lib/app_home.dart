import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rayoptics/customDialogueScreen.dart';

import 'package:rayoptics/rayDiagram/lensOptions.dart';

class App_home extends StatefulWidget {
  @override
  _App_homeState createState() => _App_homeState();
}

List<String> lens = ["Convex Lens", "Concave Lens"];

class _App_homeState extends State<App_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              text: 'RAY OPTICS',
              style: TextStyle(
                  fontFamily: 'aileron',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'visualizer',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'aileron',
                      fontStyle: FontStyle.italic),
                )
              ]),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
            );
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor('#00FF7F'),
              HexColor('#0085fe'),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'productSans',
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Licenses',
                    style: TextStyle(fontFamily: 'productSans'),
                  ),
                ),
                onTap: () => showLicensePage(
                    context: context, applicationName: 'Ray optics visualizer'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'About',
                      style: TextStyle(fontFamily: 'productSans'),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialogue();
                        });
                  }),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: '  Welcome\n',
                    style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 40,
                        color: Colors.white.withAlpha(160)),
                    children: [
                      TextSpan(
                        text: 'Click the below button to get started',
                        style:
                            TextStyle(fontFamily: 'productSans', fontSize: 14),
                      )
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LensOption();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.withAlpha(200)],
                  ),
                ),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Choose Lens',
                    style: TextStyle(
                        fontFamily: 'productSans',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
