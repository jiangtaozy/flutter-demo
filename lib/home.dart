import 'package:flutter/material.dart';
import 'layout-demo.dart';
import 'random-words.dart';
import 'custom-paint-demo.dart';
import 'other.dart';

class Home extends StatefulWidget {

  Home({Key key}): super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  final _widgetOptions = [
    LayoutDemo(),
    RandomWords(),
    CustomPaintDemo(),
    Other(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Layout')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.brush), title: Text('Paint')),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
