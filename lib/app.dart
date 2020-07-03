import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final _widgetOptions = [
    Text('Index 0: 首页'),
    Text('Index 1: 番剧'),
    Text('Index 2: 我的'),
  ];

  void onItemTapped(int idx) {
    setState(() {
      _currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('顶部')),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), title: Text('番剧')),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text('我的')),
          ],
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          onTap: onItemTapped),
    );
  }
}
