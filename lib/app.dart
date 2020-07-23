import 'package:flutter/material.dart';
import 'package:doinb/pages/home_stack/home.dart';
import 'package:doinb/pages/home_stack/mine.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _pages = [HomePage(), MinePage()];

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
