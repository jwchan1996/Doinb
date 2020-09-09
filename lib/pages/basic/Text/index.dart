import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';

class BasicTextIndexPage extends StatefulWidget {
  @override
  _BasicTextIndexPageState createState() => _BasicTextIndexPageState();
}

class _BasicTextIndexPageState extends State<BasicTextIndexPage> {
  final String data = '''
# 这里是文本组件
`Text`是显示文本的组件，最常用的组件之一。基本用法如下：
```dart
Text('老孟')
```
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文本组件'), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(10),
        child: MarkdownWidget(data: data),
      ),
    );
  }
}
