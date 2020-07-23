import 'package:flutter/material.dart';
import 'package:doinb/splashScreen.dart';
import 'package:doinb/router/router.dart' as router;

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doinb',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new SplashScreen(seconds: 3),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
