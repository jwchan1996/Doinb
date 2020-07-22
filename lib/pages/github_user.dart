import 'package:flutter/material.dart';
import 'package:clicli/api/api.dart';
import 'package:clicli/utils/http.dart';
import 'dart:convert';

class GithubUserPage extends StatefulWidget {
  @override
  _GithubUserPageState createState() => _GithubUserPageState();
}

class _GithubUserPageState extends State<GithubUserPage> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Map _user;
  String _name;

  void getUser() {
    HttpUtils.get(
      Api.getUser('jwchan1996'),
      success: (response) {
        print(response);
        //将JSON字符串转为Dart对象(此处是List)
        Map res = json.decode(response);
        print(res);
        setState(() {
          _user = res['message'];
          _name = res['message']['login'];
        });
      },
      fail: (error) {
        print(error);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('github_user'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'github_user'
            ),
          ],
        ),
      ),
    );
  }
}