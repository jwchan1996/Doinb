import 'package:flutter/material.dart';
import 'package:clicli/pages/home_stack/home.dart';
import 'package:clicli/pages/home_stack/mine.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _pages = [HomePage(), MinePage()];

//  int _currentIndex = 0;

//  final _widgetOptions = [
//    Text('Index 0: 首页'),
//    Text('Index 1: 番剧'),
//    Text('Index 2: 我的'),
//  ];

//  void onItemTapped(int idx) {
//    setState(() {
//      _currentIndex = idx;
//    });
//    if(_currentIndex == 2){
//      Navigator.pushNamed(context, '/index');
//    }
//  }

  int _currentPageIndex = 0;
  final _pageController = PageController();

  void _onPageChange(int index) {
    if (index == _currentPageIndex) return;
    setState(() {
      _currentPageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('顶部')),
//      body: Center(
//        child: _widgetOptions.elementAt(_currentIndex),
//      ),
      body: PageView.builder(
        itemCount: 2,
        controller: _pageController,
        itemBuilder: (context, index) => _pages[index],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('我的')),
          ],
          fixedColor: Colors.green,
          currentIndex: _currentPageIndex,
          onTap: _onPageChange),
    );
  }
}
