import 'package:flutter/material.dart';
import './app.dart';
import './views/Index/index.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CliCli',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new SplashScreen(seconds: 3, title: '首页',),
      routes: <String, WidgetBuilder>{
        '/Index': (BuildContext context) => new Index()
      },
    );
  }
}
