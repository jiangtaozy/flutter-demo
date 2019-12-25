/*
 * Maintained by jemo from 2019.12.25 to now
 * Created by jemo on 2019.12.25 17:42:32
 * Rotate animate
 */

import 'package:flutter/material.dart';

class RotateAnimate extends StatefulWidget {

  @override
  RotateAnimateState createState() => RotateAnimateState();
}

class RotateAnimateState extends State<RotateAnimate> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: Tween(begin: 0.0, end: -0.25).animate(_controller),
              child: Icon(Icons.camera_alt),
            ),
            RaisedButton(
              child: Text("go"),
              onPressed: () => _controller.forward(),
            ),
            RaisedButton(
              child: Text("stop"),
              onPressed: () => _controller.reset(),
            ),
          ],
        ),
      ),
    );
  }
}
