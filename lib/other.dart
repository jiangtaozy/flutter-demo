/*
 * Maintained by jemo from 2019.12.24 to now
 * Created by jemo on 2019.12.24 16:44:34
 * Other
 */

import 'package:flutter/material.dart';
import 'animate-widget.dart';
import 'navigate-screen.dart';

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
      ],
    );
  }
}
