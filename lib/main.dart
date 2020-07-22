import 'package:flutter/material.dart';
import 'package:clicli/splashScreen.dart';
import 'package:clicli/router/router.dart' as router;

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
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
