import 'package:flutter/material.dart';
import 'package:doinb/pages/home_stack/home.dart';
import 'package:doinb/pages/home_stack/basic.dart';
import 'package:doinb/pages/home_stack/widgets.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _pages = [HomePage(), BasicPage(), WidgetsPage()];

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
        itemCount: 3,
        controller: _pageController,
        itemBuilder: (context, index) => _pages[index],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.inbox), title: Text('组件基础')),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets), title: Text('332组件')),
          ],
          fixedColor: Colors.teal,
          currentIndex: _currentPageIndex,
          onTap: _onPageChange),
    );
  }
}
