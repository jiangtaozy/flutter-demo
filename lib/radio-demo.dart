/*
 * Maintained by jemo from 2020.1.10 to now
 * Created by jemo on 2020.1.10 14:40:06
 * Radio demo
 */

import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {

  @override
  RadioDemoState createState() => RadioDemoState();

}

enum SingingCharacter { lafayette, jefferson }

class RadioDemoState extends State<RadioDemo> {

  SingingCharacter _character = SingingCharacter.lafayette;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio demo'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Lafayette'),
            leading: Radio(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() { _character = value; });
              },
            ),
          ),
          ListTile(
            title: const Text('Thomas Jefferson'),
            leading: Radio(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() { _character = value; });
              },
            ),
          ),
        ],
      ),
    );
  }
}
