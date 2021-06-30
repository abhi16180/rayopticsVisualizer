import 'dart:ui';
import 'package:flutter/material.dart';
import '/rayDiagram/displayData.dart';
import 'package:hexcolor/hexcolor.dart';

class PaintConcaveLens extends StatefulWidget {
  PaintConcaveLens({Key? key}) : super(key: key);

  @override
  _PaintConcaveLensState createState() => _PaintConcaveLensState();
}

int u = 10;
double f = 50;
double v = 10.0;
double h1 = 50.0;
double h2 = 50.0;
double objectd = u.toDouble();

class _PaintConcaveLensState extends State<PaintConcaveLens> {
  @override
  Widget build(BuildContext context) {
    double swidth = (MediaQuery.of(context).size.width);
    double sheight = (MediaQuery.of(context).size.height);
    double max = swidth < 640 ? swidth / 2 - 20 : swidth / 2 - 40;
    objectd = -(swidth / 2 - u);

    double vInverse = (-1 / f + 1 / (objectd.toInt()));

    v = 1 / vInverse;
    //handling infinity error
    if (v.toString() == 'Infinity') {
      v = 1000000;
    }
    h2 = (h1 * v) / objectd;
    //to prevent error due to resizing;
    double _handle_error() {
      setState(() {});
      u = 10;
      return u.toDouble();
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title:
                Text('Concave lens', style: TextStyle(fontFamily: 'aileron')),
          ),
          preferredSize: Size(swidth, 50),
        ),
        body: Transform.scale(
          scale: 1,
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: swidth,
                    height: sheight / 1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.blue.withAlpha(0),
                    ),
                    child: ClipRRect(
                      child: CustomPaint(
                        painter: RayPaint(),
                        size: Size.infinite,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: sheight / 1.5,
                  child: Transform.scale(
                    scale: .95,
                    child: Container(
                      width: swidth,
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: swidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: SliderTheme(
                              data: SliderThemeData(
                                activeTrackColor: Colors.grey,
                                inactiveTrackColor: Colors.grey[300],
                                thumbColor: HexColor('#00FF7F'),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Row(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                'u',
                                                style: TextStyle(
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: swidth / 2,
                                              child: Slider.adaptive(
                                                min: 0,
                                                max: max,
                                                value: u.toDouble() <= max
                                                    ? u.toDouble()
                                                    : _handle_error(),
                                                onChanged: (newvalue) {
                                                  setState(() {
                                                    u = newvalue.toInt();
                                                    max = swidth;
                                                  });
                                                },
                                              ),
                                            ),
                                          ]),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4),
                                                child: Text(
                                                  'h',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                width: swidth / 2,
                                                child: Slider.adaptive(
                                                  min: 0,
                                                  max: 100,
                                                  value: h1,
                                                  onChanged: (newvalue) {
                                                    setState(() {
                                                      h1 = newvalue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4),
                                                child: Text(
                                                  'f',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                width: swidth / 2,
                                                child: Slider.adaptive(
                                                  min: 0,
                                                  max: 100,
                                                  value: f,
                                                  onChanged: (newvalue) {
                                                    setState(() {
                                                      f = newvalue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Display_Data(
                                        u: objectd.toInt(),
                                        v: v == 1000000
                                            ? "Infinity"
                                            : v.toStringAsFixed(2),
                                        h1: h1.toStringAsFixed(2),
                                        h2: v == 1000000
                                            ? "Infinity"
                                            : h2.toStringAsFixed(2),
                                        f: f.toStringAsFixed(2),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class RayPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //image distance
    var paintX = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    var x1 = Offset(0, size.height / 2);
    var x2 = Offset(size.width, size.height / 2);
    canvas.drawLine(x1, x2, paintX);
    var paintY = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    var y1 = Offset(size.width / 2, 0);
    var y2 = Offset(size.width / 2, size.height);
    canvas.drawLine(y1, y2, paintY);

    //object
    var paintObejct = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round;

    var objectBase = Offset(u.toDouble(), size.height / 2);
    var objectTop = Offset(u.toDouble(), size.height / 2 - h1);
    canvas.drawLine(objectBase, objectTop, paintObejct);
    //paint image
    var paintImage = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round;
    ;
    var imagep1 = Offset(size.width / 2 + v, size.height / 2);
    var imagep2 = Offset(size.width / 2 + v, size.height / 2 - h2);
    canvas.drawLine(imagep1, imagep2, paintImage);

    //draw lens
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(180, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    //draw lens
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5425000, size.height * 0.7157143);
    path_0.quadraticBezierTo(size.width * 0.5050000, size.height * 0.5053571,
        size.width * 0.5416667, size.height * 0.2857143);
    path_0.quadraticBezierTo(size.width * 0.5210417, size.height * 0.2860714,
        size.width * 0.4591667, size.height * 0.2871429);
    path_0.quadraticBezierTo(size.width * 0.5043750, size.height * 0.5064286,
        size.width * 0.4575000, size.height * 0.7142857);
    path_0.quadraticBezierTo(size.width * 0.4775000, size.height * 0.7157143,
        size.width * 0.5425000, size.height * 0.7157143);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    //draw focal length
    var f1p1 = Offset(size.width / 2 + f, size.height / 2 - 5);
    var f1p2 = Offset(size.width / 2 + f, size.height / 2 + 5);
    var paintf = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 2;
    var f2p1 = Offset(size.width / 2 - f, size.height / 2 - 5);
    var f2p2 = Offset(size.width / 2 - f, size.height / 2 + 5);
    canvas.drawLine(f1p1, f1p2, paintf);
    canvas.drawLine(f2p1, f2p2, paintf);
    // focal lenght text
    var textf = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: 'f',
        style: TextStyle(fontFamily: 'productSans', color: Colors.white),
      ),
    );
    textf.layout(minWidth: 0, maxWidth: 10);
    textf.paint(canvas, Offset(size.width / 2 + f - 4, size.height / 2 + 10));
    textf.paint(canvas, Offset(size.width / 2 - f - 4, size.height / 2 + 10));

    //2f
    var focal2p1 = Offset(size.width / 2 - 2 * f, size.height / 2 - 5);
    var focal22 = Offset(size.width / 2 - 2 * f, size.height / 2 + 5);
    var focal2p3 = Offset(size.width / 2 + 2 * f, size.height / 2 - 5);
    var focal24 = Offset(size.width / 2 + 2 * f, size.height / 2 + 5);
    var paint2f = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 2;
    canvas.drawLine(focal2p1, focal22, paint2f);
    canvas.drawLine(focal2p3, focal24, paint2f);
    //2f text
    var text2f = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: '2f',
        style: TextStyle(fontFamily: 'productSans', color: Colors.white),
      ),
    );
    text2f.layout(minWidth: 0, maxWidth: 20);
    text2f.paint(
        canvas, Offset(size.width / 2 + 2 * f - 4, size.height / 2 + 10));
    text2f.paint(
        canvas, Offset(size.width / 2 - 2 * f - 4, size.height / 2 + 10));

    //ray 1
    var paintRay1 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round;
    //ray 2
    var paintRay2 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round;
    //points for ray 1
    var ray1Points = [
      Offset(u.toDouble(), size.height / 2 - h1),
      Offset(size.width / 2, size.height / 2 - h1),
    ];
    canvas.drawPoints(PointMode.polygon, ray1Points, paintRay1);
    //extended line
    var paintRay1extended = Paint()..color = Colors.white;
    var raypoint1 = Offset(size.width / 2 - f, size.height / 2);
    var raypoint2 =
        Offset(size.width, size.height / 2 - (h1 * (f + size.width / 2)) / f);
    canvas.drawLine(raypoint1, raypoint2, paintRay1extended);
    //points for ray 2
    var ray2Points = [
      Offset(u.toDouble(), size.height / 2 - h1),
      Offset(size.width / 2, size.height / 2),
      Offset(size.width / 2 + v, size.height / 2 - h2)
    ];
    canvas.drawPoints(PointMode.polygon, ray2Points, paintRay2);
    //text painter
    var objectText = TextPainter(
      text: TextSpan(
        text: 'Object',
        style: TextStyle(fontFamily: 'productSans', color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    );
    objectText.layout(minWidth: 0, maxWidth: 100);
    objectText.paint(canvas, Offset(u.toDouble() - 10, size.height / 2 + 20));

    var imageText = TextPainter(
      text: TextSpan(
        text: 'Image',
        style: TextStyle(fontFamily: 'productSans', color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    );
    imageText.layout(minWidth: 0, maxWidth: 100);
    imageText.paint(canvas, Offset(size.width / 2 + v, size.height / 2 + 20));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
