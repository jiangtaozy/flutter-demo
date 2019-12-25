/*
 * Maintained by jemo from 2019.12.24 to now
 * Created by jemo on 2019.12.24 16:44:34
 * Other
 */

import 'package:flutter/material.dart';
import 'animate-widget.dart';
import 'navigate-screen.dart';
import 'animate-page.dart';
import 'animate-widget-physics.dart';
import 'animate-container.dart';
import 'fade-widget-in.dart';
import 'transform-rotate.dart';

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return MainScreen();
            }));
          },
          child: Text('aninate widget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return FirstRoute();
            }));
          },
          child: Text('navigate screen'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Page1();
            }));
          },
          child: Text('animate page'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return PhysicsCardDragDemo();
            }));
          },
          child: Text('Animate a widget using a physics'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AnimatedContainerApp();
            }));
          },
          child: Text('Animate the properties of a container'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return MyHomePage();
            }));
          },
          child: Text('Fade a widget in and out'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return TransformRotate();
            }));
          },
          child: Text('transform rotate'),
        ),
      ],
    );
  }
}
