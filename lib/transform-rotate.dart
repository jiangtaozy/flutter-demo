/*
 * Maintained by jemo from 2019.12.25 to now
 * Created by jemo on 2019.12.25 16:20:51
 * Transform.rotate
 */

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformRotate extends StatefulWidget {

  @override
  TransformRotateState createState() => TransformRotateState();
}

class TransformRotateState extends State<TransformRotate> {

  double angle = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform.rotate'),
      ),
      body: Column(
        children: <Widget>[
          Transform.rotate(
            angle: -math.pi / angle,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                angle = 2.0;
              });
            },
            child: Text('angle'),
          ),
        ],
      ),
    );
  }

}
