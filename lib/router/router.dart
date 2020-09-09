import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:doinb/app.dart';
import 'package:doinb/pages/home_stack/home.dart';
import 'package:doinb/pages/home_stack/basic.dart';
import 'package:doinb/pages/home_stack/widgets.dart';
import 'package:doinb/pages/search.dart';
import 'package:doinb/pages/github_user.dart';
import 'package:doinb/pages/get_user_media.dart';
import 'package:doinb/pages/page_effect.dart';

import 'package:doinb/pages/basic/index.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // App底部导航
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/basic':
      return MaterialPageRoute(
          builder: (context) => BasicPage());
    case '/widgets':
      return MaterialPageRoute(
          builder: (context) => WidgetsPage());

    // App其他页面
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
    case '/page_effect':
      return CupertinoPageRoute(
          builder: (context) => PageEffectPage());

    // basic组件基础模块路由
    case '/basic/index':
      return MaterialPageRoute(
          builder: (context) => BasicIndexPage());

    default:
      return MaterialPageRoute(builder: (context) => App());
  }
}
