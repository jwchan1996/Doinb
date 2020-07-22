import 'package:flutter/material.dart';
import 'package:clicli/app.dart';
import 'package:clicli/pages/home_stack/home.dart';
import 'package:clicli/pages/home_stack/mine.dart';
import 'package:clicli/pages/search.dart';
import 'package:clicli/pages/github_user.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/mine':
      return MaterialPageRoute(
          builder: (context) => MinePage());
    case '/search':
      return MaterialPageRoute(
          builder: (context) => SearchPage());
    case '/github_user':
      return MaterialPageRoute(
          builder: (context) => GithubUserPage());
    default:
      return MaterialPageRoute(builder: (context) => App());
  }
}
