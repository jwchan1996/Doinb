import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, @required this.seconds}) : super(key: key);

  //启动图持续时间
  final int seconds;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: widget.seconds);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/App');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/clicli-open.png'),
      ),
    );
  }

}