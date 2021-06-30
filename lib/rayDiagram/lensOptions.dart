import 'package:flutter/material.dart';
import 'package:rayoptics/rayDiagram/paintConcave.dart';
import 'package:rayoptics/rayDiagram/paintConvexLens.dart';

class LensOption extends StatefulWidget {
  LensOption({Key? key}) : super(key: key);

  @override
  _LensOptionState createState() => _LensOptionState();
}

class _LensOptionState extends State<LensOption> {
  List<String> lens = ["Convex Lens", "Concave Lens"];
  @override
  Widget build(BuildContext context) {
    double swidth = (MediaQuery.of(context).size).width;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Select Lens',
            style: TextStyle(fontFamily: 'aileron'),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        preferredSize: Size(swidth, 100),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: lens.length,
            itemBuilder: (BuildContext context, int item) {
              return Material(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 10,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.blue.withAlpha(140)],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            switch (lens[item]) {
                              case "Convex Lens":
                                return PaintConvexLens();
                              case "Concave Lens":
                                return PaintConcaveLens();
                              default:
                                return PaintConvexLens();
                            }
                          }),
                        );
                      },
                      child: Center(
                        child: Text(lens[item],
                            style: TextStyle(
                                fontFamily: 'productSans',
                                color: Colors.white,
                                fontSize:
                                    (MediaQuery.of(context).size.width) < 640
                                        ? 14
                                        : 18,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
