import 'package:flutter/material.dart';
import 'layout-demo.dart';
import 'random-words.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: Text('Scrolling List'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RandomWords()),
                  );
                },
            ),
            RaisedButton(
                child: Text('LayoutDemo'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LayoutDemo()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
