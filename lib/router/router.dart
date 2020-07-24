import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:doinb/app.dart';
import 'package:doinb/pages/home_stack/home.dart';
import 'package:doinb/pages/home_stack/mine.dart';
import 'package:doinb/pages/search.dart';
import 'package:doinb/pages/github_user.dart';
import 'package:doinb/pages/get_user_media.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/mine':
      return MaterialPageRoute(
          builder: (context) => MinePage());
    case '/search':
      //上下滑动切换
      return MaterialPageRoute(
          builder: (context) => SearchPage()
      );
    case '/github_user':
      //左右滑动切换
      return CupertinoPageRoute(
          builder: (context) => GithubUserPage());
    case '/get_user_media':
      return CupertinoPageRoute(
          builder: (context) => GetUserMediaPage());
    default:
      return MaterialPageRoute(builder: (context) => App());
  }
}
