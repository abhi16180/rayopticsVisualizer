import 'package:flutter/material.dart';

class Display_Data extends StatefulWidget {
  final u;
  final v;
  final h1;
  final h2;
  final f;
  Display_Data({this.u, this.v, this.h1, this.h2, this.f});

  @override
  _Display_DataState createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'u=${widget.u}\nv=${widget.v}\nh1=${widget.h1}\nh2=${widget.h2}\nf=${widget.f}',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'segoe',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
