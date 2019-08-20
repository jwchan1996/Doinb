import 'package:flutter/material.dart';
import './splashScreen.dart';
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
      home: new SplashScreen(seconds: 3),
      routes: <String, WidgetBuilder>{
        '/App': (BuildContext context) => new App(),
        '/Index': (BuildContext context) => new Index()
      },
    );
  }
}
