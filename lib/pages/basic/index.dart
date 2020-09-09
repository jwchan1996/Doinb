import 'package:flutter/material.dart';
import 'package:doinb/widgets/button_list_widget.dart';

class BasicIndexPage extends StatefulWidget {
  @override
  _BasicIndexPageState createState() => _BasicIndexPageState();
}

class _BasicIndexPageState extends State<BasicIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('基础组件'), centerTitle: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyListItem(title: '文本组件', route: '/basic/Text/index'),
            MyListItem(title: '按钮组件', route: '/basic/index'),
            MyListItem(title: '单选组件', route: '/basic/index'),
            MyListItem(title: '复选组件', route: '/basic/index'),
            MyListItem(title: '滑块组件', route: '/basic/index'),
            MyListItem(title: '开关组件', route: '/basic/index'),
            MyListItem(title: '进度组件', route: '/basic/index'),
            MyListItem(title: '输入框组件', route: '/basic/index'),
            MyListItem(title: '表单组件', route: '/basic/index'),
            MyListItem(title: '图片组件', route: '/basic/index'),
            MyListItem(title: '图标组件', route: '/basic/index'),
          ],
        ),
      )),
    );
  }
}