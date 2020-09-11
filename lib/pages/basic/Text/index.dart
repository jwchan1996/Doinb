import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

class BasicTextIndexPage extends StatefulWidget {
  @override
  _BasicTextIndexPageState createState() => _BasicTextIndexPageState();
}

class _BasicTextIndexPageState extends State<BasicTextIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文本组件'), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(15),
        child: FutureBuilder(
          future: rootBundle.loadString('assets/md/basic/Text.md'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return MarkdownWidget(data: snapshot.data);
            } else {
              return Center(
                child: Text("加载中..."),
              );
            }
          },
        ),
      ),
    );
  }
}
