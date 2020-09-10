import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';

class BasicTextIndexPage extends StatefulWidget {
  @override
  _BasicTextIndexPageState createState() => _BasicTextIndexPageState();
}

class _BasicTextIndexPageState extends State<BasicTextIndexPage> {
  final String data = '''
`Text`是显示文本的组件，最常用的组件之一。基本用法如下：
```dart
Text('老孟')
```
![image](http://img.laomengit.com/20200623220159.png)

文本的样式在`style`中设置，类型为`TextStyle`，`TextStyle`中包含很多文本样式属性，下面介绍一些常用的。

设置文本大小和颜色：
```dart
Text('老孟', style: TextStyle(color: Colors.red, fontSize: 20),),
```
![image](http://img.laomengit.com/20200623220207.png)

上面黑色的字体为没有设置的效果，作为对比。

设置字体粗细：
```dart
Text('老孟', style: TextStyle(fontWeight: FontWeight.bold))
```
![image](http://img.laomengit.com/20200623220217.png)

设置自定义的字体：

首先下载字体库（比如中华字体库）

将字体文件拷贝的项目中，一般目录是：`assets/fonts/`。

`assets`和`fonts`都需要手动创建，此目录不是必须的，而是约定俗成，资源一般都放在`assets`目录下。

配置`pubspec.yaml`：
```yaml
fonts:
  - family: maobi 
    fonts:
      - asset: assets/fonts/maobi.ttf
```

maobi：是自己对当前字体的命名，有意义即可。

asset：字体文件的目录。

使用：
```dart
Text('老孟', style: TextStyle(fontFamily: 'maobi',)),
```
![image](http://img.laomengit.com/20200623220223.png)

设置对齐方式：
```dart
Container(
  height: 100,
  width: 200,
  color: Colors.blue.withOpacity(.4),
  child: Text('老孟', textAlign: TextAlign.center),
),
```
![image](http://img.laomengit.com/20200623220227.png)

`textAlign`只是控制水平方向的对齐方式，值说明如下：

- left：左对齐
- right：右对齐
- center：居中
- justify：两端对齐，此属性中文存在`bug`（Flutter版本：1.17.3）也可以在官方`issue`中关注此问题
- start：前端对齐，和`TextDirection`属性有关，如果设置`TextDirection.ltr`，则左对齐，设置`TextDirection.rtl`则右对齐。
- end：末端对齐，和`TextDirection`属性有关，如果设置`TextDirection.ltr`，则右对齐，设置`TextDirection.rtl`则左对齐。

设置文本自动换行：
```dart
Container(
  height: 100,
  width: 200,
  color: Colors.blue.withOpacity(.4),
  child: Text('老孟，专注分享Flutter技术和应用实战',softWrap: true,),
)
```![image](http://img.laomengit.com/20200623220232.png)

文本超出范围时的处理：
```dart
Container(
  height: 100,
  width: 200,
  color: Colors.blue.withOpacity(.4),
  child: Text('老孟，专注分享Flutter技术和应用实战',overflow: TextOverflow.ellipsis,),
)
```
![image](http://img.laomengit.com/20200623220235.png)

溢出的处理方式：

- clip：直接裁剪。
- fade：越来越透明。
- ellipsis：省略号结尾。
- visible：依然显示，此时将会溢出父组件。

设置全局字体样式：

在`MaterialApp`的`theme`中设置如下
```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
   ...
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.red, fontSize: 24),
    )
  ),
  home: Scaffold(
    body: TextDemo(),
  ),
)
```

`Text`组件默认为红色，
```dart
Text('老孟'),

Text('老孟', style: TextStyle(color: Colors.blue, fontSize: 20),),
```
![image](http://img.laomengit.com/20200623220240.png)
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
