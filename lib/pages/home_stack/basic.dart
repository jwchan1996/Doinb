import 'package:flutter/material.dart';
import 'package:doinb/widgets/button_list_widget.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('组件基础'), centerTitle: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyListItem(title: '基础组件', route: '/basic/index'),
            MyListItem(
              title: '布局类组件',
            ),
            MyListItem(
              title: '容器类组件',
            ),
            MyListItem(
              title: '可滚动类组件',
            ),
            MyListItem(
              title: '功能型组件',
            ),
            MyListItem(
              title: '手势识别组件',
            ),
            MyListItem(
              title: 'Sliver系列组件',
            ),
            MyListItem(
              title: 'App级别组件',
            ),
            MyListItem(
              title: '动画',
            ),
          ],
        ),
      )),
    );
  }
}

// class MyListItem extends StatelessWidget {
//   final String title;
//   final String route;

//   const MyListItem({Key key, this.title, this.route}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           height: 50,
//           width: double.infinity,
//           margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
//           child: RaisedButton(
//             child: Text('$title',
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 14.0,
//                 )),
//             color: Color(0xffecf5ff),
//             highlightColor: Colors.blue[100],
//             splashColor: Color(0xff409eff),
//             onPressed: () {
//               Navigator.pushNamed(context, '$route');
//             },
//           )),
//     );
//   }
// }
